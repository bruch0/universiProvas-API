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
	"negative_score" integer NOT NULL,
	CONSTRAINT "professors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "tests" (
	"id" serial NOT NULL,
	"period" varchar(6) NOT NULL,
	"professor_id" integer NOT NULL,
	"type_id" integer NOT NULL,
	"subject_id" integer NOT NULL,
	"negative_score" integer NOT NULL,
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


ALTER TABLE "professors" ADD CONSTRAINT "professors_fk0" FOREIGN KEY ("university_id") REFERENCES "universities"("id");


ALTER TABLE "tests" ADD CONSTRAINT "tests_fk0" FOREIGN KEY ("professor_id") REFERENCES "professors"("id");

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk1" FOREIGN KEY ("type_id") REFERENCES "test_types"("id");

ALTER TABLE "tests" ADD CONSTRAINT "tests_fk2" FOREIGN KEY ("subject_id") REFERENCES "subjects"("id");

INSERT INTO universities (name, initials) VALUES ('Universidade de Brasília', 'UnB');	
INSERT INTO universities (name, initials) VALUES ('Universidade Federal da Grande Dourados', 'UFGD');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Goiás', 'UFG');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Mato Grosso', 'UFMT');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Mato Grosso do Sul', 'UFMS');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Catalão', 'UFCat');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Jataí', 'UFJ');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Rondonópolis', 'UFR');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal da Bahia', 'UFBA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Sul da Bahia', 'UFSB');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Recôncavo da Bahia', 'UFRB');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal da Lusofonia Afro-Brasileira', 'UNILAB');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal da Paraíba', 'UFPB');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Cariri', 'UFCA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Campina Grande', 'UFCG');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Pernambuco', 'UFPE');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Sergipe', 'UFS');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Ceará', 'UFC');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Maranhão', 'UFMA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Oeste da Bahia', 'UFOB');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Piauí', 'UFPI');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Rio Grande do Norte', 'UFRN');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Vale do São Francisco', 'UNIVASF');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal Rural de Pernambuco', 'UFRPE');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal Rural do Semi-Árido', 'UFERSA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Rondônia', 'UNIR');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Roraima', 'UFRR');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Acre', 'UFAC');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Amapá', 'UNIFAP');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Amazonas', 'UFAM');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Oeste do Pará', 'UFOPA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Pará', 'UFPA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Tocantins', 'UFT');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal Rural da Amazônia', 'UFRA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Sul e Sudeste do Pará', 'UNIFESSPA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Alfenas', 'UNIFAL-MG');
INSERT INTO universities (name, initials) VALUES ('	Universidade Federal de Itajubá', 'UNIFEI');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Juiz de Fora', 'UFJF');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Lavras', 'UFLA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Minas Gerais', 'UFMG');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Ouro Preto', 'UFOP');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de São Carlos', 'UFSCar');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de São João del-Rei', 'UFSJ');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de São Paulo', 'UNIFESP');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Uberlândia', 'UFU');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Viçosa', 'UFV');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do ABC', 'UFABC');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Espírito Santo', 'UFES');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Estado do Rio de Janeiro', 'UNIRIO');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Rio de Janeiro', 'UFRJ');
INSERT INTO universities (name, initials) VALUES ('Universidade Tecnológica Federal do Paraná', 'UTFPR');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal da Fronteira Sul', 'UFFS');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal da Integração Latino-Americana', 'UNILA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Ciências da Saúde de Porto Alegre', 'UFCSPA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Pelotas', 'UFPel');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Santa Catarina', 'UFSC');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Santa Maria', 'UFSM');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Pampa', 'UNIPAMPA');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Paraná', 'UFPR');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Rio Grande', 'FURG');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Rio Grande do Sul', 'UFRGS');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Agreste de Pernambuco', 'UFAPE');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Delta do Parnaíba', 'UFDPar');
INSERT INTO universities (name, initials) VALUES ('	Universidade Federal do Norte do Tocantins', 'UFNT');