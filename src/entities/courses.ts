import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("courses")
export class Courses {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  type: string;
}
