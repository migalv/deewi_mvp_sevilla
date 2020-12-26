import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_app_v1/data/fake_app_data.dart' as fake_app_data;
import 'package:fake_app_v1/data/faqs.dart' as data_faqs;
import 'package:fake_app_v1/models/cuisine_model.dart';
import 'package:fake_app_v1/models/dish_model.dart';

class FirestoreRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> update() async {
    List<Dish> firestoreDishes = (await _firestore.collection("dishes").get())
        .docs
        .map((doc) => Dish.fromFirestore(doc))
        .toList();
    List<Cuisine> firestoreCuisines =
        (await _firestore.collection("cuisines").get()).docs.map((doc) {
      Cuisine cuisine = Cuisine.fromFirestore(doc);
      return cuisine
        ..dishes = firestoreDishes
            .where((dish) => dish.cuisineName == cuisine.name)
            .toList();
    }).toList();

    updateCuisines(firestoreCuisines);
  }

  Future<void> uploadFAQs() async {
    for (Map<String, String> faq in data_faqs.faqs) {
      await _firestore.collection("faqs").add({
        "question": faq["question"],
        "answer": faq["answer"],
      });
    }
  }

  Future<void> updateWithLocalData() async {
    List<Dish> updatedDishes =
        (await _firestore.collection("dishes").get()).docs.map((doc) {
      Dish firestoreDish = Dish.fromFirestore(doc);
      Dish localDish = fake_app_data.fakeAppCuisines
          .singleWhere(
            (cuisine) => cuisine.name == firestoreDish.cuisineName,
            orElse: () => null,
          )
          .dishes
          .singleWhere(
            (dish) => dish.name == firestoreDish.name,
            orElse: () => null,
          );
      localDish.id = doc.id;

      return localDish;
    }).toList();

    List<Cuisine> updatedCuisines =
        (await _firestore.collection("cuisines").get()).docs.map((doc) {
      Cuisine firestoreCuisine = Cuisine.fromFirestore(doc);
      Cuisine localCuisine = fake_app_data.fakeAppCuisines.singleWhere(
        (c) => c.name == firestoreCuisine.name,
        orElse: () => null,
      );

      if (localCuisine != null) {
        localCuisine.id = doc.id;
      }

      return localCuisine;
    }).toList();

    updateCuisines(updatedCuisines);
    updateDishes(updatedDishes);
  }

  Future<void> updateCuisines(List<Cuisine> cuisines) async {
    int counter = 0;

    for (Cuisine cuisine in cuisines) {
      DocumentReference docRef =
          _firestore.collection("cuisines").doc(cuisine.id);

      if (cuisine.id == null) cuisine.id = docRef.id;

      await docRef.set(cuisine.toJson(), SetOptions(merge: true));

      counter++;
    }

    print("updated $counter cuisine docs");
  }

  Future<void> deleteCuisines() async {
    int counter = 0;

    await _firestore.collection("cuisines").get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
        counter++;
      }
    });

    print("deleted $counter cuisine docs");
  }

  Future<void> updateDishesFromCuisine(Cuisine cuisine) async {
    int counter = 0;

    for (Dish dish in cuisine.dishes) {
      DocumentReference docRef = _firestore.collection("dishes").doc(dish.id);

      dish.cuisineName = cuisine.name;

      if (dish.id == null) dish.id = docRef.id;

      await docRef.set(dish.toJson(), SetOptions(merge: true));

      counter++;
    }

    print("updated $counter dish docs from ${cuisine.name}");
  }

  Future<void> updateDishes(List<Dish> dishes) async {
    int counter = 0;

    for (Dish dish in dishes) {
      DocumentReference docRef = _firestore.collection("dishes").doc(dish.id);

      if (dish.id == null) dish.id = docRef.id;

      await docRef.set(dish.toJson(), SetOptions(merge: true));

      counter++;
    }

    print("updated $counter dish docs");
  }

  Future<void> deleteDishes() async {
    int counter = 0;

    await _firestore.collection("dishes").get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
        counter++;
      }
    });

    print("deleted $counter dish docs");
  }

  Future<List<Cuisine>> downloadData() async {
    QuerySnapshot snapshot =
        await _firestore.collection("cuisines").orderBy("name").get();

    List<Cuisine> cuisines =
        snapshot.docs.map((doc) => Cuisine.fromFirestore(doc)).toList();

    return cuisines;
  }
}
