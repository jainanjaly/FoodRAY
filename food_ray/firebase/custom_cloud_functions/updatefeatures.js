const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.updatefeatures = functions.pubsub
  .schedule("every 24 hours")
  .onRun(async (context) => {
    const db = admin.firestore();
    const today = new Date().toISOString().split("T")[0]; // Format YYYY-MM-DD

    const statisticsRef = db.collection("statistics");
    const featuresRef = db.collection("features");

    try {
      // Get the top 3 restaurants based on total_qty
      const querySnapshot = await statisticsRef
        .orderBy("last7qty")
        .limit(3)
        .get();

      const batch = db.batch();
      let rank = 1;

      querySnapshot.forEach((doc) => {
        const data = doc.data();
        const docId = `${today}_${doc.id}`; // Unique document ID per day

        const featureData = {
          rest_username: data.rest_username,
          rank: rank,
          rating: data.average_rating,
          date: today, // Store for filtering
          timestamp: admin.firestore.Timestamp.now(),
        };

        batch.set(featuresRef.doc(docId), featureData);
        rank++;
      });

      await batch.commit();
      console.log("Features updated successfully for", today);
      return null;
    } catch (error) {
      console.error("Error updating features:", error);
      return null;
    }
  });
