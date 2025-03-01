import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double? sumQty(List<FoodPostRecord>? foodpostDocs) {
  if (foodpostDocs == null) {
    return 0; // Return 0 if the list is null
  }

  double totalQty = 0;

  for (var doc in foodpostDocs) {
    totalQty += doc.quantity ?? 0; // Access quantity field directly
  }

  return totalQty;
}

int sumPeople(List<FoodClaimsRecord>? foodClaimsDocs) {
  if (foodClaimsDocs == null) {
    return 0;
  }

  int totalPeople = 0;

  for (var doc in foodClaimsDocs) {
    totalPeople += doc.noPeople ?? 0; // Use dot notation instead of []
  }

  return totalPeople;
}

DateTime? weekback() {
  return DateTime.now().subtract(Duration(days: 7));
}

double averageRating(
  double existing,
  int newrating,
) {
  return ((existing + newrating) / 2).toDouble();
}

double percentageChange(
  List<FoodClaimsRecord>? week1Docs,
  List<FoodClaimsRecord>? week2Docs,
) {
  if (week1Docs == null || week2Docs == null) {
    return 0.0;
  }

  int sumWeek1 = sumPeople(week1Docs);
  int sumWeek2 = sumPeople(week2Docs);

  if (sumWeek1 == 0) {
    return sumWeek2 > 0 ? 100.0 : 0.0; // Avoid division by zero
  }

  double percentage = (((sumWeek2 - sumWeek1) / sumWeek1.toDouble()) * 100);

  return percentage;
}

DateTime? weekBack2() {
  return DateTime.now().subtract(Duration(days: 14));
}

List<String>? getUniquePostDates() {
  // Get today's date and the past 6 days
  DateTime today = DateTime.now();

  // Generate the last 7 days, ensuring correct order (oldest first)
  List<DateTime> last7Days =
      List.generate(7, (index) => today.subtract(Duration(days: 6 - index)));

  // Convert to short weekday names (M, T, W, etc.)
  List<String> shortWeekdays = last7Days
      .map((date) => DateFormat('E').format(date)[0]) // Get first letter
      .toList();

  return shortWeekdays;
}

List<double>? getSumQuantitiesByDate(List<FoodPostRecord>? foodpostDocs) {
  if (foodpostDocs == null || foodpostDocs.isEmpty) {
    return List.filled(7, 0); // Return list with 7 zeros if no data
  }

  List<String> last7Days = List.generate(
      7,
      (index) => DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(Duration(days: index))));
  List<double> sumQuantities = List.filled(7, 0); // Initialize with 7 zeros

  for (var doc in foodpostDocs) {
    if (doc.postedTime != null && doc.quantity != null) {
      String dateKey = DateFormat('yyyy-MM-dd').format(doc.postedTime!);

      int index = last7Days.indexOf(dateKey);
      if (index != -1) {
        sumQuantities[index] += doc.quantity!;
      }
    }
  }

  return sumQuantities.reversed
      .toList(); // Return in ascending order (oldest first)
}

DateTime? yesterday() {
  return DateTime.now().subtract(Duration(days: 1));
}

List<int>? getNumFoodPostsByDate(List<FoodPostRecord>? foodpostDocs) {
  if (foodpostDocs == null || foodpostDocs.isEmpty) {
    return List.filled(7, 0); // Return [0, 0, 0, 0, 0, 0, 0] if no data
  }

  // Get today's date
  DateTime today = DateTime.now();

  // Generate last 7 days (including today) in the correct order (oldest first)
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)), // Ensures proper date alignment
  );

  // List to store post counts for each of the last 7 days
  List<int> postCounts = List.filled(7, 0); // Initialize with zeros

  for (var doc in foodpostDocs) {
    if (doc.postedTime != null) {
      // Extract only the date (ignore time)
      DateTime postDate = DateTime(
          doc.postedTime!.year, doc.postedTime!.month, doc.postedTime!.day);

      // Find the index of the post date in the last 7 days list
      int index = last7Days.indexWhere((date) => date == postDate);

      if (index != -1) {
        postCounts[index] += 1; // Increment count for the respective day
      }
    }
  }

  return postCounts;
}

List<int>? getNumPeopleFedByDate(List<FoodClaimsRecord>? foodClaims) {
  if (foodClaims == null || foodClaims.isEmpty) {
    return List.filled(7, 0); // Return [0, 0, 0, 0, 0, 0, 0] if no data
  }

  // Get today's date
  DateTime today = DateTime.now();

  // Generate last 7 days (including today) in correct order (oldest first)
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  // List to store number of people fed per day
  List<int> peopleFedCounts = List.filled(7, 0); // Initialize with zeros

  for (var claim in foodClaims) {
    if (claim.claimedTime != null && claim.noPeople != null) {
      // Use "no_people" field
      // Extract only the date (ignore time)
      DateTime claimDate = DateTime(claim.claimedTime!.year,
          claim.claimedTime!.month, claim.claimedTime!.day);

      // Find the index of the claim date in the last 7 days list
      int index = last7Days.indexWhere((date) => date == claimDate);

      if (index != -1) {
        peopleFedCounts[index] +=
            claim.noPeople!; // Use "no_people" to add the count
      }
    }
  }

  return peopleFedCounts;
}

List<double>? getFoodDonatedByDate(
  List<FoodClaimsRecord>? foodClaims,
  List<FoodPostRecord>? foodPosts,
) {
  if (foodClaims == null ||
      foodClaims.isEmpty ||
      foodPosts == null ||
      foodPosts.isEmpty) {
    return List.filled(
        7, 0.0); // Return [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] if no data
  }

  // Get today's date
  DateTime today = DateTime.now();

  // Generate last 7 days (including today) in correct order (oldest first)
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  // List to store food donated per day
  List<double> foodDonatedCounts = List.filled(7, 0.0); // Initialize with zeros

  for (var claim in foodClaims) {
    if (claim.claimedTime == null || claim.postId == null) {
      continue; // Skip invalid claims
    }

    // Extract only the claim date (ignore time)
    DateTime claimDate = DateTime(claim.claimedTime!.year,
        claim.claimedTime!.month, claim.claimedTime!.day);

    // Find the index of the claim date in the last 7 days list
    int index = last7Days.indexWhere((date) => date == claimDate);

    if (index != -1) {
      // Find matching post from foodPosts based on postId
      var matchingPosts =
          foodPosts.where((post) => post.postId == claim.postId).toList();

      if (matchingPosts.isNotEmpty && matchingPosts.first.quantity != null) {
        foodDonatedCounts[index] += matchingPosts.first.quantity!.toDouble();
      }
    }
  }

  return foodDonatedCounts;
}

List<int>? getNumPeopleFedByDateForRestaurant(
  List<FoodPostRecord>? foodPosts,
  List<FoodClaimsRecord>? foodClaims,
) {
  if (foodPosts == null ||
      foodPosts.isEmpty ||
      foodClaims == null ||
      foodClaims.isEmpty) {
    return List.filled(7, 0); // Return [0, 0, 0, 0, 0, 0, 0] if no data
  }

  // Get today's date
  DateTime today = DateTime.now();

  // Generate last 7 days (including today) in correct order (oldest first)
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  // List to store number of people fed per day
  List<int> peopleFedCounts = List.filled(7, 0); // Initialize with zeros

  for (var post in foodPosts) {
    if (post.postId == null) {
      continue; // Skip invalid posts
    }

    // Find claims related to this post
    var relatedClaims =
        foodClaims.where((claim) => claim.postId == post.postId).toList();

    for (var claim in relatedClaims) {
      if (claim.claimedTime != null && claim.noPeople != null) {
        // Extract only the claim date (ignore time)
        DateTime claimDate = DateTime(claim.claimedTime!.year,
            claim.claimedTime!.month, claim.claimedTime!.day);

        // Find the index of the claim date in the last 7 days list
        int index = last7Days.indexWhere((date) => date == claimDate);

        if (index != -1) {
          peopleFedCounts[index] += claim.noPeople!; // Add number of people fed
        }
      }
    }
  }

  return peopleFedCounts;
}

List<double>? getOverallFoodPostedByDate(List<FoodPostRecord>? foodPosts) {
  if (foodPosts == null || foodPosts.isEmpty) {
    return List.filled(7, 0.0);
  }

  DateTime today = DateTime.now();
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  List<double> foodPostedCounts = List.filled(7, 0.0);

  for (var post in foodPosts) {
    if (post.postedTime != null && post.quantity != null) {
      DateTime postDate = DateTime(
          post.postedTime!.year, post.postedTime!.month, post.postedTime!.day);
      int index = last7Days.indexWhere((date) => date == postDate);

      if (index != -1) {
        foodPostedCounts[index] += post.quantity!.toDouble();
      }
    }
  }

  return foodPostedCounts;
}

List<int>? getOverallPeopleFedByDate(List<FoodClaimsRecord>? foodClaims) {
  if (foodClaims == null || foodClaims.isEmpty) {
    return List.filled(7, 0);
  }

  DateTime today = DateTime.now();
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  List<int> peopleFedCounts = List.filled(7, 0);

  for (var claim in foodClaims) {
    if (claim.claimedTime != null && claim.noPeople != null) {
      DateTime claimDate = DateTime(claim.claimedTime!.year,
          claim.claimedTime!.month, claim.claimedTime!.day);
      int index = last7Days.indexWhere((date) => date == claimDate);

      if (index != -1) {
        peopleFedCounts[index] += claim.noPeople!;
      }
    }
  }

  return peopleFedCounts;
}

List<int>? getOverallFoodPostsByDate(List<FoodPostRecord>? foodPosts) {
  if (foodPosts == null || foodPosts.isEmpty) {
    return List.filled(7, 0);
  }

  DateTime today = DateTime.now();
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  List<int> foodPostsCounts = List.filled(7, 0);

  for (var post in foodPosts) {
    if (post.postedTime != null) {
      DateTime postDate = DateTime(
          post.postedTime!.year, post.postedTime!.month, post.postedTime!.day);
      int index = last7Days.indexWhere((date) => date == postDate);

      if (index != -1) {
        foodPostsCounts[index] += 1;
      }
    }
  }

  return foodPostsCounts;
}

List<int>? getOverallFoodClaimsByDate(List<FoodClaimsRecord>? foodClaims) {
  if (foodClaims == null || foodClaims.isEmpty) {
    return List.filled(7, 0);
  }

  DateTime today = DateTime.now();
  List<DateTime> last7Days = List.generate(
    7,
    (index) => DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: 6 - index)),
  );

  List<int> foodClaimsCounts = List.filled(7, 0);

  for (var claim in foodClaims) {
    if (claim.claimedTime != null) {
      DateTime claimDate = DateTime(claim.claimedTime!.year,
          claim.claimedTime!.month, claim.claimedTime!.day);
      int index = last7Days.indexWhere((date) => date == claimDate);

      if (index != -1) {
        foodClaimsCounts[index] += 1;
      }
    }
  }

  return foodClaimsCounts;
}
