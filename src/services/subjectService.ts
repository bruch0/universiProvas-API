import { getConnection } from "typeorm";
import { Subjects } from "../entities/subjects";
import { CourseSubjects } from "../entities/courseSubjects";
import { Subject } from "../interfaces/subject";

const getCourseSubjects = async (universityId: number, courseId: number) => {
  const subjects: Subject[] = await getConnection()
    .createQueryBuilder()
    .select(["subjects.name as name", "subjects.code as code"])
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

  const subjectsByPeriods: any = [];
  let maxPeriod = 1;

  subjects.forEach((subject) => {
    if (subject.period > maxPeriod) {
      maxPeriod = subject.period;
    }
  });

  let actualPeriod = 1;

  for (let i = 0; i < maxPeriod; i++) {
    const filteredSubjects: any = [];
    subjects.forEach((sub) => {
      if (sub.period === actualPeriod) {
        filteredSubjects.push({
          name: sub.name,
          code: sub.code,
        });
      }
    });

    subjectsByPeriods.push({
      period: actualPeriod,
      subjects: filteredSubjects,
    });

    actualPeriod += 1;
  }

  // const filteredSubjects = subjects.filter((sub) => {
  //   console.log(sub.period, period);
  //   return (sub.period = period);
  // });

  // subjectsByPeriods.push({
  //   period,
  //   subjects: filteredSubjects,
  // });

  // period += 1;
  //   });

  return subjectsByPeriods;
};

export { getCourseSubjects };
