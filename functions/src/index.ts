/* eslint-disable max-len */
import * as admin from "firebase-admin";
import * as user from "./user";

// Initialize
admin.initializeApp();

// User
exports.onUserCreated = user.createUserDocument;
