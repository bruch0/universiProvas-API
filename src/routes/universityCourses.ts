import express from "express";
import * as courseController from "../controllers/universityCoursesController";

const router = express.Router();

router.get("/courses/:universityId", courseController.getCoursesByUniversity);

export default router;
