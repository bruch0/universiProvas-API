import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("test_types")
export class TestTypes {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;
}
