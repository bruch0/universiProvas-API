import { getConnection, getManager } from "typeorm";
import { Subjects } from "../entities/subjects";
import { Courses } from "../entities/courses";
import { CourseSubjects } from "../entities/courseSubjects";
import { Subject } from "../interfaces/subject";
import { Professors } from "../entities/professors";
import { Universities } from "../entities/university";
import { Tests } from "../entities/tests";

const getCourseSubjects = async (universityId: number, courseId: number) => {
  const subjects: Subject[] = await getConnection()
    .createQueryBuilder()
    .select([
      "subjects.id as id",
      "subjects.name as name",
      "subjects.code as code",
    ])
    .from(Subjects, "subjects")
    .leftJoin(
      CourseSubjects,
      "courses_subjects",
      "courses_subjects.subject_id = subjects.id"
    )
    .addSelect("courses_subjects.period as period")
    .where(`courses_subjects.university_id = ${universityId}`)
    .andWhere(`courses_subjects.course_id = ${courseId}`)
    .execute();

  const subjectsCodes = await getConnection()
    .createQueryBuilder()
    .select("subjects.code as code")
    .from(Tests, "tests")
    .leftJoin(
      CourseSubjects,
      "courses_subjects",
      "tests.subject_id = courses_subjects.subject_id"
    )
    .leftJoin(Professors, "professors", "tests.professor_id = professors.id")
    .leftJoin(
      Universities,
      "universities",
      "professors.university_id = universities.id"
    )
    .leftJoin(Subjects, "subjects", "tests.subject_id = subjects.id")
    .where(`universities.id = ${universityId}`)
    .andWhere(`courses_subjects.course_id = ${courseId}`)
    .execute();

  const subjectsTestCount: any = {};

  subjectsCodes.forEach((subject: any) => {
    subjectsTestCount[subject.code] = subjectsTestCount[subject.code]
      ? subjectsTestCount[subject.code] + 1
      : 1;
  });

  const courses = await getConnection()
    .createQueryBuilder()
    .select("courses.name as name")
    .from(Courses, "courses")
    .where(`id = ${courseId}`)
    .execute();

  const subjectsByPeriods: any = [];
  let maxPeriod = 1;

  subjects.forEach((subject) => {
    if (subject.period > maxPeriod) {
      maxPeriod = subject.period;
    }

    subject.count = subjectsTestCount[subject.code] || "0";
  });

  let actualPeriod = 1;

  for (let i = 0; i < maxPeriod; i++) {
    const filteredSubjects: any = [];
    subjects.forEach((sub) => {
      if (sub.period === actualPeriod) {
        filteredSubjects.push({
          id: sub.id,
          name: sub.name,
          code: sub.code,
          totalTests: sub.count,
        });
      }
    });

    subjectsByPeriods.push({
      period: actualPeriod,
      subjects: filteredSubjects,
    });

    actualPeriod += 1;
  }

  return { subjects: subjectsByPeriods, course: courses[0].name };
};

export { getCourseSubjects };
