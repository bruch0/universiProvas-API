import express from "express";
import * as testController from "../controllers/testController";

const router = express.Router();

router.get("/tests", testController.getCourseSubjects);

export default router;
