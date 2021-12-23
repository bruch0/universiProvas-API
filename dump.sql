CREATE TABLE "universities" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	"initials" varchar(12) NOT NULL UNIQUE,
	CONSTRAINT "universities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "professors" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"university_id" integer NOT NULL,
	CONSTRAINT "professors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "tests" (
	"id" serial NOT NULL,
	"year" varchar(6) NOT NULL,
	"professor_id" integer NOT NULL,
	"type_id" integer NOT NULL,
	"course_id" integer NOT NULL,
	"subject_id" integer NOT NULL,
	"url" varchar(255) NOT NULL,
	CONSTRAINT "tests_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "test_types" (
	"id" serial NOT NULL,
	"name" varchar(10) NOT NULL,
	CONSTRAINT "test_types_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "subjects" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"code" varchar(20) NOT NULL,
	CONSTRAINT "subjects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "courses" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"type" varchar(255),
	CONSTRAINT "courses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "universities_courses" (
	"id" serial NOT NULL,
	"university_id" integer NOT NULL,
	"course_id" integer NOT NULL,
	CONSTRAINT "universities_courses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "courses_subjects" (
	"id" serial NOT NULL,
	"course_id" integer NOT NULL,
	"subject_id" integer NOT NULL,
	"university_id" integer NOT NULL,
	"period" integer NOT NULL,
	CONSTRAINT "courses_subjects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "professors_courses" (
	"id" serial NOT NULL,
	"professor_id" integer NOT NULL,
	"course_id" integer NOT NULL,
	CONSTRAINT "professors_courses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "professors" ADD CONSTRAINT "professors_fk0" FOREIGN KEY ("university_id") REFERENCES "universities"("id");


ALTER TABLE "tests" ADD CONSTRAINT "tests_fk0" FOREIGN KEY ("professor_id") REFERENCES "professors"("id");

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk1" FOREIGN KEY ("type_id") REFERENCES "test_types"("id");

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk2" FOREIGN KEY ("subject_id") REFERENCES "subjects"("id");

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk3" FOREIGN KEY ("course_id") REFERENCES "courses"("id");


ALTER TABLE "universities_courses" ADD CONSTRAINT "universities_courses_fk0" FOREIGN KEY ("university_id") REFERENCES "universities"("id");

ALTER TABLE "universities_courses" ADD CONSTRAINT "universities_courses_fk1" FOREIGN KEY ("course_id") REFERENCES "courses"("id");


ALTER TABLE "courses_subjects" ADD CONSTRAINT "courses_subjects_fk0" FOREIGN KEY ("course_id") REFERENCES "courses"("id");

ALTER TABLE "courses_subjects" ADD CONSTRAINT "courses_subjects_fk1" FOREIGN KEY ("subject_id") REFERENCES "subjects"("id");

ALTER TABLE "courses_subjects" ADD CONSTRAINT "courses_subjects_fk2" FOREIGN KEY ("university_id") REFERENCES "universities"("id");


ALTER TABLE "professors_courses" ADD CONSTRAINT "professors_courses_fk0" FOREIGN KEY ("professor_id") REFERENCES "professors"("id");

ALTER TABLE "professors_courses" ADD CONSTRAINT "professors_courses_fk1" FOREIGN KEY ("course_id") REFERENCES "courses"("id");


INSERT INTO test_types (name) VALUES ('P1');
INSERT INTO test_types (name) VALUES ('P2');
INSERT INTO test_types (name) VALUES ('P3');
INSERT INTO test_types (name) VALUES ('2CH');
INSERT INTO test_types (name) VALUES ('Outros');


INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Santa Catarina', 'UFSC');	


INSERT INTO courses (name, type) VALUES ('Administração', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Animação', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Arquitetura e Urbanismo', 'Bacharelado');


INSERT INTO subjects (name, code) VALUES ('Introdução a Administração', 'CAD7001');
INSERT INTO subjects (name, code) VALUES ('Formação Profissional (RSC) e Ética Empresarial', 'CAD7105');
INSERT INTO subjects (name, code) VALUES ('Teoria Econômica', 'CNM5145');
INSERT INTO subjects (name, code) VALUES ('Estudos Filosóficos', 'FIL7102');
INSERT INTO subjects (name, code) VALUES ('Pré-Cálculo', 'MTM3100');
INSERT INTO subjects (name, code) VALUES ('Cálculo para Ciências Sociais', 'MTM3700');
INSERT INTO subjects (name, code) VALUES ('Ciência Política', 'SPO7001');
INSERT INTO subjects (name, code) VALUES ('Teorias da Administração', 'CAD7002');
INSERT INTO subjects (name, code) VALUES ('Contabilidade Aplicada à Administração', 'CCN7001');
INSERT INTO subjects (name, code) VALUES ('Metodologia da Pesquisa Bibliográfica ', 'CIN7002');
INSERT INTO subjects (name, code) VALUES ('Direito Administrativo', 'DIR7001');
INSERT INTO subjects (name, code) VALUES ('Estatística para Administradores I', 'INE7001');
INSERT INTO subjects (name, code) VALUES ('Administração da Comunicação', 'CAD7003');
INSERT INTO subjects (name, code) VALUES ('Organização, Sistemas e Métodos', 'CAD7213');
INSERT INTO subjects (name, code) VALUES ('Formação Profissional Inovação e Conhecimento', 'CAD7720');
INSERT INTO subjects (name, code) VALUES ('Direito Empresarial', 'DIR7002');
INSERT INTO subjects (name, code) VALUES ('Estatística para Administradores II', 'INE7002');
INSERT INTO subjects (name, code) VALUES ('Matemática Financeira', 'MTM3561');
INSERT INTO subjects (name, code) VALUES ('Cultura Empreendedora e Criatividade', 'CAD7004');
INSERT INTO subjects (name, code) VALUES ('Formação Profissional Governança', 'CAD7104');
INSERT INTO subjects (name, code) VALUES ('Administração de Custos', 'CCN7002');
INSERT INTO subjects (name, code) VALUES ('Introdução a Pesquisa Operacional', 'EPS7042');
INSERT INTO subjects (name, code) VALUES ('Psicologia Organizacional', 'PSI7002');
INSERT INTO subjects (name, code) VALUES ('Sociologia Aplicada', 'SPO7003');
INSERT INTO subjects (name, code) VALUES ('Administração Financeira I', 'CAD7131');
INSERT INTO subjects (name, code) VALUES ('Administração de Recursos Humanos I ', 'CAD7138');
INSERT INTO subjects (name, code) VALUES ('Administração de Marketing', 'CAD7218');
INSERT INTO subjects (name, code) VALUES ('Administração de Materiais', 'CAD7219');
INSERT INTO subjects (name, code) VALUES ('Laboratório de Gestão', 'CAD 7715');
INSERT INTO subjects (name, code) VALUES ('Administração da Produção I', 'CAD7114');
INSERT INTO subjects (name, code) VALUES ('Administração Financeira II', 'CAD7132');
INSERT INTO subjects (name, code) VALUES ('Administração de Recursos Humanos II', 'CAD7139');
INSERT INTO subjects (name, code) VALUES ('Administração da Tecnologia da Informação e Comunicação', 'CAD7222');
INSERT INTO subjects (name, code) VALUES ('Laboratório de Gestão: Organização da Sociedade Civil', 'CAD7826');
INSERT INTO subjects (name, code) VALUES ('Administração da Produção II', 'CAD7122');
INSERT INTO subjects (name, code) VALUES ('Pesquisa Mercadológica', 'CAD7225');
INSERT INTO subjects (name, code) VALUES ('Desenvolvimento de Recursos Humanos', 'CAD7233');
INSERT INTO subjects (name, code) VALUES ('Laboratório de Gestão: Prática Profissional', 'CAD7303');
INSERT INTO subjects (name, code) VALUES ('Mercado de Capitais', 'CNM7102');
INSERT INTO subjects (name, code) VALUES ('Logística e Cadeia de Suprimentos', 'CAD7220');
INSERT INTO subjects (name, code) VALUES ('Planejamento Financeiro e Orçamentário', 'CAD7228');
INSERT INTO subjects (name, code) VALUES ('Administração de Projetos', 'CAD7231');
INSERT INTO subjects (name, code) VALUES ('Estratégia Mercadológica', 'CAD7232');
INSERT INTO subjects (name, code) VALUES ('Laboratório de Gestão: Projeto de Trabalho de Curso', 'CAD7304');
INSERT INTO subjects (name, code) VALUES ('Processo Decisório', 'CAD7226');
INSERT INTO subjects (name, code) VALUES ('Administração Estratégica', 'CAD7234');
INSERT INTO subjects (name, code) VALUES ('Empreendimentos e Modelos de Negociação', 'CAD7235');


INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 1, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 2, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 3, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 4, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 5, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 6, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 7, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 8, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 9, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 10, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 11, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 12, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 13, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 14, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 15, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 16, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 17, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 18, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 19, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 20, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 21, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 22, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 23, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 24, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 25, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 26, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 27, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 28, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 29, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 30, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 31, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 32, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 33, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 34, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 35, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 36, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 37, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 38, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 39, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 40, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 41, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 42, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 43, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 44, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 45, 9);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 46, 9);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 1, 47, 9);


INSERT INTO professors (name, university_id) VALUES ('Alexandre Marino Costa', 1);
INSERT INTO professors (name, university_id) VALUES ('Alexandre Moraes Ramos', 1);
INSERT INTO professors (name, university_id) VALUES ('Allan Augusto Platt', 1);
INSERT INTO professors (name, university_id) VALUES ('Ana Luiza Paraboni', 1);
INSERT INTO professors (name, university_id) VALUES ('André Luís da Silva Leite', 1);
INSERT INTO professors (name, university_id) VALUES ('Andressa Sasaki Vasques Pacheco', 1);
INSERT INTO professors (name, university_id) VALUES ('Ani Caroline Grigion Potrich', 1);
INSERT INTO professors (name, university_id) VALUES ('Bernardo Meyer', 1);
INSERT INTO professors (name, university_id) VALUES ('Cibele Barsalini Martins', 1);
INSERT INTO professors (name, university_id) VALUES ('Claudelino Martins Dias Junior', 1);
INSERT INTO professors (name, university_id) VALUES ('Gabriela Gonçalves Silveira Fiates', 1);
INSERT INTO professors (name, university_id) VALUES ('Gerson Rizzatti Júnior', 1);
INSERT INTO professors (name, university_id) VALUES ('Helena Kuerten de Salles Uglione', 1);
INSERT INTO professors (name, university_id) VALUES ('Irineu Manoel de Souza', 1);
INSERT INTO professors (name, university_id) VALUES ('Joana Stelzer', 1);
INSERT INTO professors (name, university_id) VALUES ('Kellen da Silva Coelho', 1);
INSERT INTO professors (name, university_id) VALUES ('Márcia Barros de Sales', 1);
INSERT INTO professors (name, university_id) VALUES ('Marcos Antonio de Moraes Ocke', 1);
INSERT INTO professors (name, university_id) VALUES ('Marcos Baptista Lopez Dalmau', 1);
INSERT INTO professors (name, university_id) VALUES ('Marcos Abilio Bosquetti', 1);
INSERT INTO professors (name, university_id) VALUES ('Marcus Vinícius Andrade de Lima', 1);
INSERT INTO professors (name, university_id) VALUES ('Martin de La Martinière Petroll', 1);
INSERT INTO professors (name, university_id) VALUES ('Marilda Todescat', 1);
INSERT INTO professors (name, university_id) VALUES ('Mário de Souza Almeida', 1);
INSERT INTO professors (name, university_id) VALUES ('Mauricio Fernandes Pereira', 1);
INSERT INTO professors (name, university_id) VALUES ('Maurício R. Serva de Oliveira', 1);
INSERT INTO professors (name, university_id) VALUES ('Paulo Otolini Garrido', 1);
INSERT INTO professors (name, university_id) VALUES ('Pedro Antônio de Melo', 1);
INSERT INTO professors (name, university_id) VALUES ('Raphael Schlickmann', 1);
INSERT INTO professors (name, university_id) VALUES ('Rebeca de Moraes Ribeiro de Barcellos', 1);
INSERT INTO professors (name, university_id) VALUES ('Renê Birochi', 1);
INSERT INTO professors (name, university_id) VALUES ('Ricardo Niehues Buss', 1);
INSERT INTO professors (name, university_id) VALUES ('Rogério Tadeu de Oliveira Lacerda', 1);
INSERT INTO professors (name, university_id) VALUES ('Rosalia Barbosa Lavarda', 1);
INSERT INTO professors (name, university_id) VALUES ('Rudimar Antunes da Rocha', 1);
INSERT INTO professors (name, university_id) VALUES ('Sérgio Luis Boeira', 1);
INSERT INTO professors (name, university_id) VALUES ('Taisa Dias', 1);
INSERT INTO professors (name, university_id) VALUES ('Ângela Cristina Correa', 1);
INSERT INTO professors (name, university_id) VALUES ('Gabriela Mattei de Souza', 1);
INSERT INTO professors (name, university_id) VALUES ('Inara Antunes Vieira Willerding', 1);
INSERT INTO professors (name, university_id) VALUES ('Arcângelo dos Santos Safanelli', 1);
INSERT INTO professors (name, university_id) VALUES ('Luiz Salgado Klaes', 1);


INSERT INTO professors_courses (professor_id, course_id) VALUES (1, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (2, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (3, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (4, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (5, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (6, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (7, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (8, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (9, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (10, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (11, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (12, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (13, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (14, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (15, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (16, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (17, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (18, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (19, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (20, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (21, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (22, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (23, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (24, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (25, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (26, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (27, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (28, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (29, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (30, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (31, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (32, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (33, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (34, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (35, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (36, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (37, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (38, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (39, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (40, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (41, 1);
INSERT INTO professors_courses (professor_id, course_id) VALUES (42, 1);