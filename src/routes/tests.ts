import express from "express";

import * as testController from "../controllers/testController";

const router = express.Router();

router.get("/tests/:courseId", testController.getTestNeededInfo);

router.post("/tests", testController.uploadTest);

export default router;
