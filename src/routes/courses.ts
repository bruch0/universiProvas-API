import express from "express";
import * as courseController from "../controllers/universityCourseController";

const router = express.Router();

router.get("/courses/:universityId", courseController.getCoursesByUniversity);

export default router;
