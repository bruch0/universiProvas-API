import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database/database";
import universitiesRoute from "./routes/universities";
import universityCoursesRoute from "./routes/universityCourses";
import courseProfessorsRoute from "./routes/courseProfessors";
import professorTestsRoute from "./routes/professorTests";
import courseSubjectsRoute from "./routes/courseSubjects";
import subjectTestsRoute from "./routes/subjectTests";
import testRoute from "./routes/tests";

import errorRoute from "./middlewares/errorRoute";
import inexistentRoute from "./routes/inexistentRoute";

const app = express();
app.use(express.json());
app.use(cors());

app.use(universitiesRoute);
app.use(universityCoursesRoute);
app.use(courseProfessorsRoute);
app.use(professorTestsRoute);
app.use(courseSubjectsRoute);
app.use(subjectTestsRoute);
app.use(testRoute);

app.use(errorRoute);
app.use(inexistentRoute);

export async function init() {
  await connectDatabase();
}

export default app;
