import express from "express";
import * as subjectController from "../controllers/subjectController";

const router = express.Router();

router.get(
  "/subjects/:universityId/:courseId",
  subjectController.getCourseSubjects
);

export default router;
