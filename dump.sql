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
	"code" varchar(20) NOT NULL UNIQUE,
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
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Minas Gerais', 'UFMG');


INSERT INTO courses (name, type) VALUES ('Administração', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Animação', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Arquitetura e Urbanismo', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Odontologia', 'Bacharelado');


INSERT INTO subjects (name, code) VALUES ('Introdução a Administração', 'CAD7001');
INSERT INTO subjects (name, code) VALUES ('Formação Profissional (RSC) e Ética Empresarial', 'CAD7105');
INSERT INTO subjects (name, code) VALUES ('Teoria Econômica', 'CNM5145');
INSERT INTO subjects (name, code) VALUES ('Estudos Filosóficos', 'FIL7102');
INSERT INTO subjects (name, code) VALUES ('Pré-Cálculo', 'MTM3100');
INSERT INTO subjects (name, code) VALUES ('Cálculo para Ciências Sociais', 'MTM3700');
INSERT INTO subjects (name, code) VALUES ('Ciência Política', 'SPO7001');
INSERT INTO subjects (name, code) VALUES ('Teorias da Administração', 'CAD7002');
INSERT INTO subjects (name, code) VALUES ('Contabilidade Aplicada à Administração', 'CCN7001');
INSERT INTO subjects (name, code) VALUES ('Metodologia da Pesquisa Bibliográfica', 'CIN7002');
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
INSERT INTO subjects (name, code) VALUES ('Administração de Recursos Humanos I', 'CAD7138');
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
INSERT INTO subjects (name, code) VALUES ('Desenho de Observação', 'EGR7105');
INSERT INTO subjects (name, code) VALUES ('História da Arte', 'EGR7107');
INSERT INTO subjects (name, code) VALUES ('Teoria da Cor', 'EGR7109');
INSERT INTO subjects (name, code) VALUES ('Plástica', 'EGR7110');
INSERT INTO subjects (name, code) VALUES ('Semiótica', 'EGR7113');
INSERT INTO subjects (name, code) VALUES ('Tratamento de Imagem I', 'EGR7192');
INSERT INTO subjects (name, code) VALUES ('Animação e Cinema', 'EGR7212');
INSERT INTO subjects (name, code) VALUES ('Desenho Aplicado', 'EGR7108');
INSERT INTO subjects (name, code) VALUES ('Ilustração Digital', 'EGR7190');
INSERT INTO subjects (name, code) VALUES ('Narrativa e Linguagem Visual', 'EGR7411');
INSERT INTO subjects (name, code) VALUES ('Roteiro e Direção', 'EGR7424');
INSERT INTO subjects (name, code) VALUES ('Princípios de Animação', 'EGR7434');
INSERT INTO subjects (name, code) VALUES ('Design de Personagens e Concept Art', 'EGR5026');
INSERT INTO subjects (name, code) VALUES ('Edição de Som', 'EGR7422');
INSERT INTO subjects (name, code) VALUES ('Edição e Composição de Vídeo', 'EGR7423');
INSERT INTO subjects (name, code) VALUES ('Design de Cenários', 'EGR7431');
INSERT INTO subjects (name, code) VALUES ('Gestão de Projetos', 'EGR5014');
INSERT INTO subjects (name, code) VALUES ('Laboratório de Animação', 'EGR5030');
INSERT INTO subjects (name, code) VALUES ('Stop-motion', 'EGR7129');
INSERT INTO subjects (name, code) VALUES ('Animação de Personagens', 'EGR7481');
INSERT INTO subjects (name, code) VALUES ('Modelagem de Personagens', 'EGR7251');
INSERT INTO subjects (name, code) VALUES ('Animação 3D', 'EGR7441');
INSERT INTO subjects (name, code) VALUES ('Modelagem 3D', 'EGR7443');
INSERT INTO subjects (name, code) VALUES ('Rendering de Animação', 'EGR7444');
INSERT INTO subjects (name, code) VALUES ('História da Arte, Arquitetura e Urbanismo I', 'ARQ5621');
INSERT INTO subjects (name, code) VALUES ('Introdução ao Projeto de Arquitetura e do Urbanismo', 'ARQ5631');
INSERT INTO subjects (name, code) VALUES ('Experimentação I', 'ARQ5641');
INSERT INTO subjects (name, code) VALUES ('Geometria Descritiva', 'EGR5605');
INSERT INTO subjects (name, code) VALUES ('Oficina do Desenho I', 'EGR5611');
INSERT INTO subjects (name, code) VALUES ('Historia da Arte, Arquitetura e Urbanismo II', 'ARQ5622');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico e Paisagismo I', 'ARQ5633');
INSERT INTO subjects (name, code) VALUES ('Introdução a Análise de Estruturas', 'ARQ5640');
INSERT INTO subjects (name, code) VALUES ('Experimentação II', 'ARQ5642');
INSERT INTO subjects (name, code) VALUES ('Topografia Aplicada', 'ECV5631');
INSERT INTO subjects (name, code) VALUES ('Oficina de Desenho II', 'EGR5612');
INSERT INTO subjects (name, code) VALUES ('Teoria Urbana I', 'ARQ5614');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico e Programação Visual II', 'ARQ5634');
INSERT INTO subjects (name, code) VALUES ('Introdução a Física do Ambiente Construído', 'ARQ5654');
INSERT INTO subjects (name, code) VALUES ('Tecnologia da Edificação I', 'ARQ5661');
INSERT INTO subjects (name, code) VALUES ('Resistência dos Sólidos', 'ECV5645');
INSERT INTO subjects (name, code) VALUES ('Introdução ao CAAD', 'EGR5607');
INSERT INTO subjects (name, code) VALUES ('Urbanismo I', 'ARQ5602');
INSERT INTO subjects (name, code) VALUES ('História da Arte, Arquitetura e Urbanismo III', 'ARQ5623');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico III', 'ARQ5635');
INSERT INTO subjects (name, code) VALUES ('Conforto Ambiental - Térmico', 'ARQ5655');
INSERT INTO subjects (name, code) VALUES ('Tecnologia da Edificação II', 'ARQ5662');
INSERT INTO subjects (name, code) VALUES ('Instalações Prediais I', 'ECV5643');
INSERT INTO subjects (name, code) VALUES ('Urbanismo e Paisagismo II', 'ARQ5603');
INSERT INTO subjects (name, code) VALUES ('Arquitetura Brasileira I', 'ARQ5624');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico IV', 'ARQ5636');
INSERT INTO subjects (name, code) VALUES ('Conforto Ambiental - Iluminação', 'ARQ5656');
INSERT INTO subjects (name, code) VALUES ('Tecnologia da Edificação III', 'ARQ5663');
INSERT INTO subjects (name, code) VALUES ('Instalações Prediais II', 'ECV5644');
INSERT INTO subjects (name, code) VALUES ('Estática e Sistemas Estruturais I', 'ECV5647');
INSERT INTO subjects (name, code) VALUES ('Urbanismo e Paisagismo III', 'ARQ5605');
INSERT INTO subjects (name, code) VALUES ('Sistemas Urbanos', 'ARQ5610');
INSERT INTO subjects (name, code) VALUES ('Teoria e Estética do Projeto', 'ARQ5612');
INSERT INTO subjects (name, code) VALUES ('Historia da Cidade I', 'ARQ5617');
INSERT INTO subjects (name, code) VALUES ('Arquitetura Brasileira II', 'ARQ5625');
INSERT INTO subjects (name, code) VALUES ('Eficiência Energética e Sustentabilidade em Edificações', 'ARQ5658');
INSERT INTO subjects (name, code) VALUES ('Tecnologia da Edificação IV', 'ARQ5664');
INSERT INTO subjects (name, code) VALUES ('Estruturas de Concreto', 'ECV5648');
INSERT INTO subjects (name, code) VALUES ('Urbanismo e Paisagismo IV', 'ARQ5606');
INSERT INTO subjects (name, code) VALUES ('Teoria Urbana II', 'ARQ5615');
INSERT INTO subjects (name, code) VALUES ('Historia da Cidade II', 'ARQ5618');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico V', 'ARQ5637');
INSERT INTO subjects (name, code) VALUES ('Conforto Ambiental - Acústica', 'ARQ5657');
INSERT INTO subjects (name, code) VALUES ('Estruturas de Aço', 'ECV5649');
INSERT INTO subjects (name, code) VALUES ('Urbanismo V', 'ARQ5607');
INSERT INTO subjects (name, code) VALUES ('Teoria Urbana III', 'ARQ5616');
INSERT INTO subjects (name, code) VALUES ('Arquitetura Latino Americana', 'ARQ5626');
INSERT INTO subjects (name, code) VALUES ('Patrimônio Histórico e Técnicas Retrospectivas', 'ARQ5627');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico VI', 'ARQ5638');
INSERT INTO subjects (name, code) VALUES ('Estruturas de Madeira', 'ECV5650');
INSERT INTO subjects (name, code) VALUES ('Projeto Arquitetônico VII', 'ARQ5639');
INSERT INTO subjects (name, code) VALUES ('Introducao ao Estudo Da Genetica E Evolucao', 'BIG148');
INSERT INTO subjects (name, code) VALUES ('Bioquímica', 'BIQ062');
INSERT INTO subjects (name, code) VALUES ('Biofísica', 'FIB037');
INSERT INTO subjects (name, code) VALUES ('Biologia Celular', 'MOF052');
INSERT INTO subjects (name, code) VALUES ('Biologia do Desenvolvimento', 'MOF053');
INSERT INTO subjects (name, code) VALUES ('Anatomia Humana Básica', 'MOF054');
INSERT INTO subjects (name, code) VALUES ('Odontologia e Universidade', 'OSP022');
INSERT INTO subjects (name, code) VALUES ('Ciências Sociais Articuladas', 'OSP040');
INSERT INTO subjects (name, code) VALUES ('Imunologia', 'BIQ059');
INSERT INTO subjects (name, code) VALUES ('Diagnóstico Planejamento na Atenção Individual À Sáude Bucal', 'CPC026');
INSERT INTO subjects (name, code) VALUES ('Fisiologia Básica', 'FIB038');
INSERT INTO subjects (name, code) VALUES ('Fundamentos da Microbiologia', 'MIC027');
INSERT INTO subjects (name, code) VALUES ('Histologia', 'MOF055');
INSERT INTO subjects (name, code) VALUES ('Anatomia Odontológica', 'MOF056');
INSERT INTO subjects (name, code) VALUES ('Trabalho de Conclusão De Curso I', 'OPO013');
INSERT INTO subjects (name, code) VALUES ('Introdução à Epidemiologia E Bioestatística', 'OSP023');
INSERT INTO subjects (name, code) VALUES ('Introdução à Prática Clínica', 'CPC044');
INSERT INTO subjects (name, code) VALUES ('Fundamentos da Farmacologia', 'FAR032');
INSERT INTO subjects (name, code) VALUES ('Fundamentos da Odontologia Restauradora', 'INU018');
INSERT INTO subjects (name, code) VALUES ('Microbiologia Aplicada à Odontologia', 'MIC028');
INSERT INTO subjects (name, code) VALUES ('Materiais Dentários I', 'ODR041');
INSERT INTO subjects (name, code) VALUES ('Prevenção Individual à Cárie e Aos Problemas de Oclusão', 'OPO014');
INSERT INTO subjects (name, code) VALUES ('Patologia Geral', 'PAG016');
INSERT INTO subjects (name, code) VALUES ('Cirurgia Ambulatorial I', 'CPC027');
INSERT INTO subjects (name, code) VALUES ('Patologia, Estomatologia e Radiologia I', 'CPC028');
INSERT INTO subjects (name, code) VALUES ('Farmacologia Odontológica', 'FAR033');
INSERT INTO subjects (name, code) VALUES ('Atenção Integral ao Adolescente', 'INU019');
INSERT INTO subjects (name, code) VALUES ('Oclusão', 'ODR042');
INSERT INTO subjects (name, code) VALUES ('Patologia, Estomatologia e Radiologia II', 'CPC029');
INSERT INTO subjects (name, code) VALUES ('Dentística I', 'ODR043');
INSERT INTO subjects (name, code) VALUES ('Endodontia I', 'ODR044');
INSERT INTO subjects (name, code) VALUES ('Práticas Laboratoriais em Restaurações Metálicas', 'ODR045');
INSERT INTO subjects (name, code) VALUES ('Materiais Dentáros II', 'ODR046');
INSERT INTO subjects (name, code) VALUES ('Atenção Integral à Criança I', 'OPO016');
INSERT INTO subjects (name, code) VALUES ('Integralidade do Cuidado', 'OSP024');
INSERT INTO subjects (name, code) VALUES ('Periodontia I', 'CPC030');
INSERT INTO subjects (name, code) VALUES ('Cirurgia Ambulatorial II', 'CPC031');
INSERT INTO subjects (name, code) VALUES ('Atenção Integral ao Adulto I', 'CPC045');
INSERT INTO subjects (name, code) VALUES ('Dentística II', 'ODR047');
INSERT INTO subjects (name, code) VALUES ('Atenção Integral à Criança Ii', 'OPO017');
INSERT INTO subjects (name, code) VALUES ('Endodontia II', 'ODR048');
INSERT INTO subjects (name, code) VALUES ('Dentística III', 'ODR049');
INSERT INTO subjects (name, code) VALUES ('Atenção Integral ao Adulto Ii', 'ODR065');
INSERT INTO subjects (name, code) VALUES ('Periodontia II', 'CPC032');
INSERT INTO subjects (name, code) VALUES ('Prótese Fixa I', 'ODR050');
INSERT INTO subjects (name, code) VALUES ('Atenção Integral ao Adulto e ao Idoso', 'ODR066');
INSERT INTO subjects (name, code) VALUES ('Prótese Parcial Removível', 'ODR051');
INSERT INTO subjects (name, code) VALUES ('Prótese Total Removível', 'ODR052');
INSERT INTO subjects (name, code) VALUES ('Organização da Prática Odontológica', 'OSP026');
INSERT INTO subjects (name, code) VALUES ('Urgências Odontológicas', 'CPC046');


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
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 48, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 49, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 50, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 51, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 52, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 53, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 54, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 55, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 56, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 57, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 58, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 59, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 60, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 61, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 62, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 63, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 64, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 65, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 66, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 67, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 68, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 69, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 70, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 2, 71, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 72, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 73, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 74, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 75, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 76, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 77, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 78, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 79, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 80, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 81, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 82, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 83, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 84, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 85, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 86, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 87, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 88, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 89, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 90, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 91, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 92, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 93, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 94, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 95, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 96, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 97, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 98, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 99, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 100, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 101, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 102, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 103, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 104, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 105, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 106, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 107, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 108, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 109, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 110, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 111, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 112, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 113, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 114, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 115, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 116, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 117, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 118, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 119, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 120, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 121, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 122, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (1, 3, 123, 9);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 124, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 125, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 126, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 127, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 128, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 129, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 130, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 131, 1);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 132, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 133, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 134, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 135, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 136, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 137, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 138, 2);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 139, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 140, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 141, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 142, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 143, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 144, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 145, 3);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 146, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 147, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 148, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 149, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 150, 4);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 151, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 152, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 153, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 154, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 155, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 156, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 157, 5);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 158, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 159, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 160, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 161, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 162, 6);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 163, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 164, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 165, 7);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 166, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 167, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 168, 8);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 169, 9);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 170, 9);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 171, 9);
INSERT INTO courses_subjects (university_id, course_id, subject_id, period) VALUES (2, 4, 172, 1);


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
INSERT INTO professors (name, university_id) VALUES ('Andre Luiz Sens', 1);
INSERT INTO professors (name, university_id) VALUES ('André Salomão', 1);
INSERT INTO professors (name, university_id) VALUES ('Chrystianne Goulart Ivanoski', 1);
INSERT INTO professors (name, university_id) VALUES ('Clóvis Geyer Pereira', 1);
INSERT INTO professors (name, university_id) VALUES ('Eliete Auxiliadora Assunção Ourives', 1);
INSERT INTO professors (name, university_id) VALUES ('Eugenio Andres Diaz Merino', 1);
INSERT INTO professors (name, university_id) VALUES ('Fernanda Iervolino', 1);
INSERT INTO professors (name, university_id) VALUES ('Flávio Andaló', 1);
INSERT INTO professors (name, university_id) VALUES ('Igor Reszka Pinheiro', 1);
INSERT INTO professors (name, university_id) VALUES ('Josiane Wanderlinde Vieira', 1);
INSERT INTO professors (name, university_id) VALUES ('Luiz Fernando Gonçalves De Figueiredo', 1);
INSERT INTO professors (name, university_id) VALUES ('Milton Luiz Horn Vieira', 1);
INSERT INTO professors (name, university_id) VALUES ('Monica Stein', 1);
INSERT INTO professors (name, university_id) VALUES ('Morgana De Franceschi Hoefel', 1);
INSERT INTO professors (name, university_id) VALUES ('Patrick Martinelli Veiga', 1);
INSERT INTO professors (name, university_id) VALUES ('Paulo De Tarso Mendes Luna', 1);
INSERT INTO professors (name, university_id) VALUES ('Rafael Luiz Marques Ary', 1);
INSERT INTO professors (name, university_id) VALUES ('Richard Perassi Luiz De Sousa', 1);
INSERT INTO professors (name, university_id) VALUES ('Rosana Andrade Dias Do Nascimento', 1);
INSERT INTO professors (name, university_id) VALUES ('Adriana Marques Rossetto', 1);
INSERT INTO professors (name, university_id) VALUES ('Alcimir Jose De Paris', 1);
INSERT INTO professors (name, university_id) VALUES ('Almir Francisco Reis', 1);
INSERT INTO professors (name, university_id) VALUES ('Ana Angélica Dantas Alves', 1);
INSERT INTO professors (name, university_id) VALUES ('Anderson Claro', 1);
INSERT INTO professors (name, university_id) VALUES ('Anna Freitas Portela De Souza Pimenta', 1);
INSERT INTO professors (name, university_id) VALUES ('Ayrton Portilho Bueno', 1);
INSERT INTO professors (name, university_id) VALUES ('Carlos Eduardo Verzola Vaz', 1);
INSERT INTO professors (name, university_id) VALUES ('Eduardo Westphal', 1);
INSERT INTO professors (name, university_id) VALUES ('Evandro Fiorin', 1);
INSERT INTO professors (name, university_id) VALUES ('Fabio Ferreira Lins Mosaner', 1);
INSERT INTO professors (name, university_id) VALUES ('Fernando Simon Westphal', 1);
INSERT INTO professors (name, university_id) VALUES ('Francisco Antônio Carneiro Ferreira', 1);
INSERT INTO professors (name, university_id) VALUES ('Joao Souza', 1);
INSERT INTO professors (name, university_id) VALUES ('João Paulo Schwerz', 1);
INSERT INTO professors (name, university_id) VALUES ('José Ripper Kos', 1);
INSERT INTO professors (name, university_id) VALUES ('Karine Daufenbach', 1);
INSERT INTO professors (name, university_id) VALUES ('Letícia Mattana', 1);
INSERT INTO professors (name, university_id) VALUES ('Lisiane Ilha Librelotto', 1);
INSERT INTO professors (name, university_id) VALUES ('Lucas Sabino Dias', 1);
INSERT INTO professors (name, university_id) VALUES ('Luís Roberto Marques Da Silveira', 1);
INSERT INTO professors (name, university_id) VALUES ('Maíra Longhinotti Felippe', 1);
INSERT INTO professors (name, university_id) VALUES ('Maria Ines Sugai', 1);
INSERT INTO professors (name, university_id) VALUES ('Marina Toneli Siqueira', 1);
INSERT INTO professors (name, university_id) VALUES ('Maristela Moraes De Almeida', 1);
INSERT INTO professors (name, university_id) VALUES ('Martin Gabriel Ordenes Mizgier', 1);
INSERT INTO professors (name, university_id) VALUES ('Michele Fossati', 1);
INSERT INTO professors (name, university_id) VALUES ('Milton Luz Da Conceição', 1);
INSERT INTO professors (name, university_id) VALUES ('Paolo Colosso', 1);
INSERT INTO professors (name, university_id) VALUES ('Pedro Ernesto Buhler', 1);
INSERT INTO professors (name, university_id) VALUES ('Ramon Silva De Carvalho', 1);
INSERT INTO professors (name, university_id) VALUES ('Raphael Grazziano', 1);
INSERT INTO professors (name, university_id) VALUES ('Renato Tibiriça de Saboya', 1);
INSERT INTO professors (name, university_id) VALUES ('Ricardo Socas Wiese', 1);
INSERT INTO professors (name, university_id) VALUES ('Roberta Krahe Edelweiss', 1);
INSERT INTO professors (name, university_id) VALUES ('Rodrigo Almeida Bastos', 1);
INSERT INTO professors (name, university_id) VALUES ('Rodrigo Gonçalves Dos Santos', 1);
INSERT INTO professors (name, university_id) VALUES ('Samuel Steiner Dos Santos', 1);
INSERT INTO professors (name, university_id) VALUES ('Sergio Torres Moraes', 1);
INSERT INTO professors (name, university_id) VALUES ('Soraya Nór', 1);
INSERT INTO professors (name, university_id) VALUES ('Thêmis Da Cruz Fagundes', 1);
INSERT INTO professors (name, university_id) VALUES ('Alexandre Fortes Drummond', 2);
INSERT INTO professors (name, university_id) VALUES ('Aline Araújo Sampaio', 2);
INSERT INTO professors (name, university_id) VALUES ('Allyson Nogueira Moreira', 2);
INSERT INTO professors (name, university_id) VALUES ('Amália Moreno', 2);
INSERT INTO professors (name, university_id) VALUES ('Ana Cecília Diniz Viana', 2);
INSERT INTO professors (name, university_id) VALUES ('Ana Cristina Borges de Oliveira', 2);
INSERT INTO professors (name, university_id) VALUES ('Andrea Clemente Palmier', 2);
INSERT INTO professors (name, university_id) VALUES ('Andreia Maria Araújo Drummond', 2);
INSERT INTO professors (name, university_id) VALUES ('Andréa Maria Duarte Vargas', 2);
INSERT INTO professors (name, university_id) VALUES ('Antônio Paulino Ribeiro Sobrinho', 2);
INSERT INTO professors (name, university_id) VALUES ('Carlos Eduardo Assis Dutra', 2);
INSERT INTO professors (name, university_id) VALUES ('CARLOS JOSÉ DE PAULA SILVA', 2);
INSERT INTO professors (name, university_id) VALUES ('Carolina de Castro Martins', 2);
INSERT INTO professors (name, university_id) VALUES ('Carolina Nemesio de Barros Pereira', 2);
INSERT INTO professors (name, university_id) VALUES ('Célia Regina Moreira Lanza', 2);
INSERT INTO professors (name, university_id) VALUES ('Celio Soares de Oliveira Junior', 2);
INSERT INTO professors (name, university_id) VALUES ('Cláudia Borges Brasileiro', 2);
INSERT INTO professors (name, university_id) VALUES ('Cláudia Lopes Brilhante Bhering', 2);
INSERT INTO professors (name, university_id) VALUES ('Cláudia Silami de Magalhães', 2);
INSERT INTO professors (name, university_id) VALUES ('Cláudio Rômulo Comunian', 2);
INSERT INTO professors (name, university_id) VALUES ('Cristiane Baccin Bendo Neves', 2);
INSERT INTO professors (name, university_id) VALUES ('Denise Vieira Travassos', 2);
INSERT INTO professors (name, university_id) VALUES ('Eduardo Lemos de Souza', 2);
INSERT INTO professors (name, university_id) VALUES ('Efigênia Ferreira e Ferreira', 2);
INSERT INTO professors (name, university_id) VALUES ('Elen Marise de Oliveira Oleto', 2);
INSERT INTO professors (name, university_id) VALUES ('Elizabeth Maria Bastos Lages', 2);
INSERT INTO professors (name, university_id) VALUES ('Ênio Lacerda Vilaça', 2);
INSERT INTO professors (name, university_id) VALUES ('Evandro Guimarães Aguiar', 2);
INSERT INTO professors (name, university_id) VALUES ('Fabiana Vargas Ferreira', 2);
INSERT INTO professors (name, university_id) VALUES ('Fabiano Araújo Cunha', 2);
INSERT INTO professors (name, university_id) VALUES ('Felipe Eduardo Baires Campos', 2);
INSERT INTO professors (name, university_id) VALUES ('Felipe Paiva Fonseca', 2);
INSERT INTO professors (name, university_id) VALUES ('Fernanda Bartolomeo Freire-Maia', 2);
INSERT INTO professors (name, university_id) VALUES ('Fernanda Brasil Daura Jorge Boos Lima', 2);
INSERT INTO professors (name, university_id) VALUES ('Fernanda de Morais Ferreira', 2);
INSERT INTO professors (name, university_id) VALUES ('Fernando de Oliveira Costa', 2);
INSERT INTO professors (name, university_id) VALUES ('Flávio de Freitas Mattos', 2);
INSERT INTO professors (name, university_id) VALUES ('Francisca Daniele Jardilino Silami', 2);
INSERT INTO professors (name, university_id) VALUES ('Guilherme Costa Carvalho Silva', 2);
INSERT INTO professors (name, university_id) VALUES ('Helenaura Pereira Machado Carvalhais', 2);
INSERT INTO professors (name, university_id) VALUES ('Henrique Pretti', 2);
INSERT INTO professors (name, university_id) VALUES ('Herbert Haueisen Sander', 2);
INSERT INTO professors (name, university_id) VALUES ('Hernan Rodrigo Lopez Vizuette', 2);
INSERT INTO professors (name, university_id) VALUES ('Hugo Henriques Alvim', 2);
INSERT INTO professors (name, university_id) VALUES ('Isabela Almeida Pordeus', 2);
INSERT INTO professors (name, university_id) VALUES ('Ivan Doche Barreiros', 2);
INSERT INTO professors (name, university_id) VALUES ('Ivana Márcia Alves Diniz', 2);
INSERT INTO professors (name, university_id) VALUES ('Janice Simpson de Paula', 2);
INSERT INTO professors (name, university_id) VALUES ('Joana Ramos Jorge', 2);
INSERT INTO professors (name, university_id) VALUES ('João Batista Novaes Júnior', 2);
INSERT INTO professors (name, university_id) VALUES ('João Henrique Lara do Amaral', 2);
INSERT INTO professors (name, university_id) VALUES ('João Maurício Lima de Figueiredo Mota', 2);
INSERT INTO professors (name, university_id) VALUES ('Jose Augusto Cesar Discacciati', 2);
INSERT INTO professors (name, university_id) VALUES ('José Eustáquio da Costa', 2);
INSERT INTO professors (name, university_id) VALUES ('Juliana Vilela Bastos', 2);
INSERT INTO professors (name, university_id) VALUES ('Júnia Maria Cheib Serra Negra', 2);
INSERT INTO professors (name, university_id) VALUES ('Katia Lucy de Melo Maltos', 2);
INSERT INTO professors (name, university_id) VALUES ('Leandro Napier de Souza', 2);
INSERT INTO professors (name, university_id) VALUES ('Leniana Santos Neves', 2);
INSERT INTO professors (name, university_id) VALUES ('Leonardo Foresti Soares de Menezes', 2);
INSERT INTO professors (name, university_id) VALUES ('Lia Silva de Castilho', 2);
INSERT INTO professors (name, university_id) VALUES ('Lincoln Dias Lanza', 2);
INSERT INTO professors (name, university_id) VALUES ('Lívia Guimarães Zina', 2);
INSERT INTO professors (name, university_id) VALUES ('Loliza Chalub Luiz Figueiredo Houri', 2);
INSERT INTO professors (name, university_id) VALUES ('Lucas Guimarães Abreu', 2);
INSERT INTO professors (name, university_id) VALUES ('Luiz Carlos Feitosa Henriques', 2);
INSERT INTO professors (name, university_id) VALUES ('Luiz César Fonseca Alves', 2);
INSERT INTO professors (name, university_id) VALUES ('Luís Otavio de Miranda Cota', 2);
INSERT INTO professors (name, university_id) VALUES ('Mara Valadares de Abreu', 2);
INSERT INTO professors (name, university_id) VALUES ('Mara Vasconcelos', 2);
INSERT INTO professors (name, university_id) VALUES ('Marcelo Drummond Naves', 2);
INSERT INTO professors (name, university_id) VALUES ('Marcos Azeredo Furquim Werneck', 2);
INSERT INTO professors (name, university_id) VALUES ('Marcos Daniel Septímio Lanza', 2);
INSERT INTO professors (name, university_id) VALUES ('Marcus Martins Guimarães', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Auxiliadora Vieira do Carmo', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Carmen Fonseca Serpa Carvalho', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Cassia Ferreira de Aguiar', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Elisa de Souza e Silva', 2);
INSERT INTO professors (name, university_id) VALUES ('María Esperanza Cortés Segura', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Guiomar de Azevedo Bahia', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Inês Barreiros Senna', 2);
INSERT INTO professors (name, university_id) VALUES ('Maria Luiza de Moraes Oliveira', 2);
INSERT INTO professors (name, university_id) VALUES ('Maurício Augusto Aquino de Castro', 2);
INSERT INTO professors (name, university_id) VALUES ('Mauro Henrique Nogueira Guimarães de Abreu', 2);
INSERT INTO professors (name, university_id) VALUES ('Miriam Pimenta Parreira do Vale', 2);
INSERT INTO professors (name, university_id) VALUES ('Monica Yamauti', 2);
INSERT INTO professors (name, university_id) VALUES ('Najara Barbosa da Rocha', 2);
INSERT INTO professors (name, university_id) VALUES ('Nelson Renato França Alves da Silva', 2);
INSERT INTO professors (name, university_id) VALUES ('Patrícia Carlos Caldeira', 2);
INSERT INTO professors (name, university_id) VALUES ('Patricia Maria Zarzar', 2);
INSERT INTO professors (name, university_id) VALUES ('Patricia Valente Araujo', 2);
INSERT INTO professors (name, university_id) VALUES ('Paulo Antônio Martins Júnior', 2);
INSERT INTO professors (name, university_id) VALUES ('Rafael Ribeiro Teixeira', 2);
INSERT INTO professors (name, university_id) VALUES ('Rafael Paschoal Esteves Lima', 2);
INSERT INTO professors (name, university_id) VALUES ('Rafaela da Silveira Pinto', 2);
INSERT INTO professors (name, university_id) VALUES ('Raquel Conceição Ferreira', 2);
INSERT INTO professors (name, university_id) VALUES ('Raquel Gonçalves Vieira de Andrade', 2);
INSERT INTO professors (name, university_id) VALUES ('Renata de Castro Martins', 2);
INSERT INTO professors (name, university_id) VALUES ('Renata Magalhães Cyrino', 2);
INSERT INTO professors (name, university_id) VALUES ('Ricardo Alves de Mesquita', 2);
INSERT INTO professors (name, university_id) VALUES ('Ricardo Reis Oliveira', 2);
INSERT INTO professors (name, university_id) VALUES ('Ricardo Rodrigues Vaz', 2);
INSERT INTO professors (name, university_id) VALUES ('Ricardo Santiago Gomez', 2);
INSERT INTO professors (name, university_id) VALUES ('Rodrigo de Castro Albuquerque', 2);
INSERT INTO professors (name, university_id) VALUES ('Rodrigo Richard da Silveira', 2);
INSERT INTO professors (name, university_id) VALUES ('Rogéli Tibúrcio Ribeiro da Cunha Peixoto', 2);
INSERT INTO professors (name, university_id) VALUES ('Romulo Hissa Ferreira', 2);
INSERT INTO professors (name, university_id) VALUES ('Rosa Núbia Vieira De Moura', 2);
INSERT INTO professors (name, university_id) VALUES ('Roselaine Moreira Coelho Milagres', 2);
INSERT INTO professors (name, university_id) VALUES ('Saul Martins de Paiva', 2);
INSERT INTO professors (name, university_id) VALUES ('Sérgio Carvalho Costa', 2);
INSERT INTO professors (name, university_id) VALUES ('Sergio Monteiro Lima Júnior', 2);
INSERT INTO professors (name, university_id) VALUES ('Sheyla Márcia Auad', 2);
INSERT INTO professors (name, university_id) VALUES ('Silvia Ferreira de Souza', 2);
INSERT INTO professors (name, university_id) VALUES ('Tania Mara Pimenta Amaral', 2);
INSERT INTO professors (name, university_id) VALUES ('Tarcília Aparecida da Silva', 2);
INSERT INTO professors (name, university_id) VALUES ('Tathiane Larissa Lenzi', 2);
INSERT INTO professors (name, university_id) VALUES ('Telma Campos Medeiros Lorentz', 2);
INSERT INTO professors (name, university_id) VALUES ('Thaís Yumi Umeda Suzuki', 2);
INSERT INTO professors (name, university_id) VALUES ('Tulimar Pereira Machado Cornacchia', 2);
INSERT INTO professors (name, university_id) VALUES ('Ulisses Eliezer Salomao', 2);
INSERT INTO professors (name, university_id) VALUES ('Vagner Rodrigues Santos', 2);
INSERT INTO professors (name, university_id) VALUES ('Vera Lucia Silva Resende', 2);
INSERT INTO professors (name, university_id) VALUES ('Viviane Elisângela Gomes', 2);
INSERT INTO professors (name, university_id) VALUES ('Walison Arthuso Vasconcellos', 2);
INSERT INTO professors (name, university_id) VALUES ('Warley Luciano Fonseca Tavares', 2);


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
INSERT INTO professors_courses (professor_id, course_id) VALUES (43, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (44, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (45, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (46, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (47, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (48, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (49, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (50, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (51, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (52, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (53, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (54, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (55, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (56, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (57, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (58, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (59, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (60, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (61, 2);
INSERT INTO professors_courses (professor_id, course_id) VALUES (62, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (63, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (64, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (65, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (66, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (67, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (68, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (69, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (70, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (71, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (72, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (73, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (74, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (75, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (76, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (77, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (78, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (79, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (80, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (81, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (82, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (83, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (84, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (85, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (86, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (87, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (88, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (89, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (90, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (91, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (92, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (93, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (94, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (95, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (96, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (97, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (98, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (99, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (100, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (101, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (102, 3);
INSERT INTO professors_courses (professor_id, course_id) VALUES (103, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (104, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (105, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (106, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (107, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (108, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (109, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (110, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (111, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (112, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (113, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (114, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (115, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (116, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (117, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (118, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (119, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (120, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (121, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (122, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (123, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (124, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (125, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (126, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (127, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (128, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (129, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (130, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (131, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (132, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (133, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (134, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (135, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (136, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (137, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (138, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (139, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (140, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (141, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (142, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (143, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (144, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (145, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (146, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (147, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (148, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (149, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (150, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (151, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (152, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (153, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (154, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (155, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (156, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (157, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (158, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (159, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (160, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (161, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (162, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (163, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (164, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (165, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (166, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (167, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (168, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (169, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (170, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (171, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (172, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (173, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (174, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (175, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (176, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (177, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (178, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (179, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (180, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (181, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (182, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (183, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (184, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (185, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (186, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (187, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (188, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (189, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (190, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (191, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (192, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (193, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (194, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (195, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (196, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (197, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (198, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (199, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (200, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (201, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (202, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (203, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (204, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (205, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (206, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (207, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (208, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (209, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (210, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (211, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (212, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (213, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (214, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (215, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (216, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (217, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (218, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (219, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (220, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (221, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (222, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (223, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (224, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (225, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (226, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (227, 4);
INSERT INTO professors_courses (professor_id, course_id) VALUES (228, 4);

INSERT INTO universities_courses (university_id, course_id) VALUES (1, 1);
INSERT INTO universities_courses (university_id, course_id) VALUES (1, 2);
INSERT INTO universities_courses (university_id, course_id) VALUES (1, 3);
INSERT INTO universities_courses (university_id, course_id) VALUES (2, 4);