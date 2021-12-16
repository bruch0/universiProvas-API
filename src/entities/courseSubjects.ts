import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("courses_subjects")
export class CourseSubjects {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  period: string;

  @Column()
  course_id: number;

  @Column()
  subject_id: number;

  @Column()
  university_id: number;
}
