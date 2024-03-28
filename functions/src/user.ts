import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import {logger} from "firebase-functions";

export const createUserDocument = functions.region("europe-west1")
  .auth.user().onCreate(async (user) => {
    const userRef = admin.firestore().collection("users").doc(user.uid);
    console.log("Creating document for user:", user.uid);

    const userMap = {
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      fcmTokens: [],
      photoURL: user.photoURL,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    };

    logger.info("usermap", userMap);


    try {
      await userRef.set(userMap);
      console.log("Document created for user:", user.uid);
    } catch (error) {
      console.error("Error creating document for user:", user.uid, error);
    }
  });
