import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("tests")
export class Tests {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  period: number;

  @Column()
  professor_id: number;

  @Column()
  type_id: number;

  @Column()
  subject_id: number;
}
