const admin = require("firebase-admin/app");
admin.initializeApp();

const updatefeatures = require("./updatefeatures.js");
exports.updatefeatures = updatefeatures.updatefeatures;
const updateFeatures = require("./update_features.js");
exports.updateFeatures = updateFeatures.updateFeatures;
