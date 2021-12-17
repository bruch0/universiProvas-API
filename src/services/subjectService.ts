import { getConnection, getManager } from "typeorm";
import { Subjects } from "../entities/subjects";
import { CourseSubjects } from "../entities/courseSubjects";
import { Subject } from "../interfaces/subject";
import { TestCount } from "../interfaces/testCount";

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

  const subjectsTestCount: TestCount[] = await getManager().query(`
	SELECT COUNT (tests.subject_id), subjects.code
		FROM tests
			JOIN courses_subjects ON tests.subject_id = courses_subjects.subject_id
			JOIN professors ON tests.professor_id = professors.id 
			JOIN subjects ON subjects.id = tests.subject_id
				WHERE professors.id = 1
			AND
				courses_subjects.course_id = 32
					GROUP BY subjects.code 
    
	`);

  const subjectsByPeriods: any = [];
  let maxPeriod = 1;

  subjects.forEach((subject) => {
    if (subject.period > maxPeriod) {
      maxPeriod = subject.period;
    }

    subjectsTestCount.forEach((testCount) => {
      if (subject.code === testCount.code) {
        subject.count = testCount.count;
      }
    });
  });

  let actualPeriod = 1;

  for (let i = 0; i < maxPeriod; i++) {
    const filteredSubjects: any = [];
    subjects.forEach((sub) => {
      if (sub.period === actualPeriod) {
        filteredSubjects.push({
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

  return subjectsByPeriods;
};

export { getCourseSubjects };
