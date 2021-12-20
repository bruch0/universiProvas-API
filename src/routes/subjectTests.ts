import express from "express";
import * as subjectTestsController from "../controllers/subjectTestsController";

const router = express.Router();

router.get(
  "/subjects/:universityId/:subjectId/tests",
  subjectTestsController.getSubjectTests
);

export default router;
