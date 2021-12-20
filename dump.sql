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


ALTER TABLE "universities_courses" ADD CONSTRAINT "universities_courses_fk0" FOREIGN KEY ("university_id") REFERENCES "universities"("id");

ALTER TABLE "universities_courses" ADD CONSTRAINT "universities_courses_fk1" FOREIGN KEY ("course_id") REFERENCES "courses"("id");


ALTER TABLE "courses_subjects" ADD CONSTRAINT "courses_subjects_fk0" FOREIGN KEY ("course_id") REFERENCES "courses"("id");

ALTER TABLE "courses_subjects" ADD CONSTRAINT "courses_subjects_fk1" FOREIGN KEY ("subject_id") REFERENCES "subjects"("id");

ALTER TABLE "courses_subjects" ADD CONSTRAINT "courses_subjects_fk2" FOREIGN KEY ("university_id") REFERENCES "universities"("id");


ALTER TABLE "professors_courses" ADD CONSTRAINT "professors_courses_fk0" FOREIGN KEY ("professor_id") REFERENCES "professors"("id");

ALTER TABLE "professors_courses" ADD CONSTRAINT "professors_courses_fk1" FOREIGN KEY ("course_id") REFERENCES "courses"("id");


INSERT INTO test_types (name) VALUES ('P1')
INSERT INTO test_types (name) VALUES ('P2')
INSERT INTO test_types (name) VALUES ('P3')
INSERT INTO test_types (name) VALUES ('2CH')
INSERT INTO test_types (name) VALUES ('Outros')

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
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Alagoas', 'UFAL');
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
INSERT INTO universities (name, initials) VALUES ('Universidade Federal de Itajubá', 'UNIFEI');
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
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Triângulo Mineiro', 'UFTM');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal dos Vales do Jequitinhonha e Mucuri', 'UFVJM');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal Fluminense', 'UFF');
INSERT INTO universities (name, initials) VALUES ('Universidade Federal Rural do Rio de Janeiro', 'UFRRJ');
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
INSERT INTO universities (name, initials) VALUES ('Universidade Federal do Norte do Tocantins', 'UFNT');


INSERT INTO courses (name, type) VALUES ('Administração', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Agronomia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Arqueologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Arquitetura e Urbanismo', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Artes Visuais', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Artes Visuais', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Biblioteconomia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Biomedicina', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciência da Computação', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciências Biológicas', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciências Biológicas', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Ciências Atuariais', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciências Contábeis', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciências Militares', 'Bacharelado (oferta exclusiva das Forças Armadas e Auxiliares)[2]');
INSERT INTO courses (name, type) VALUES ('Ciências Econômicas', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciências Naturais', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Ciências Sociais', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Ciências Sociais', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Cinema e Audiovisual', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Dança', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Dança', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Design', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Direito', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Educação Física', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Educação Física', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Enfermagem', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Aeronáutica', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Agrícola', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Ambiental e Sanitária', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Cartográfica e de Agrimensura', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Civil', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Alimentos', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Bioprocessos', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Computação', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Controle e Automação', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Fortificação e Construção', 'Bacharelado (oferta exclusiva das Forças Armadas)');
INSERT INTO courses (name, type) VALUES ('Engenharia de Materiais', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Minas', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Pesca', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Petróleo', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Produção', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia de Telecomunicações', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Elétrica', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Eletrônica', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Florestal', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Mecânica', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Mecânica de Armamentos', 'Bacharelado (oferta exclusiva das Forças Armadas)');
INSERT INTO courses (name, type) VALUES ('Engenharia Mecânica de Veículos Militares', 'Bacharelado (oferta exclusiva das Forças Armadas)');
INSERT INTO courses (name, type) VALUES ('Engenharia Metalúrgica', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Naval', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Química', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Engenharia Têxtil', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Estatística', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Farmácia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Filosofia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Filosofia', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Física', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Física', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Fisioterapia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Fonoaudiologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Geografia', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Geografia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Geologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('História', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('História', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Informática', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Jornalismo', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Letras', 'Língua Estrangeira');
INSERT INTO courses (name, type) VALUES ('Letras', 'Língua Portuguesa');
INSERT INTO courses (name, type) VALUES ('Letras', 'Língua Estrangeira');
INSERT INTO courses (name, type) VALUES ('Letras', 'Língua Portuguesa');
INSERT INTO courses (name, type) VALUES ('Matemática', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Matemática', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Medicina', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Medicina Veterinária', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Meteorologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Museologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Música', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Música', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Nutrição', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Odontologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Pedagogia', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Psicologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Publicidade e Propaganda', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Química', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Química', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Radio, TV, Internet (Comunicação Audiovisual e Multimídia)', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Relações Internacionais', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Relações Públicas', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Secretariado Executivo', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Serviço Social', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Sistemas da Informação', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Teatro', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Teatro', 'Licenciatura');
INSERT INTO courses (name, type) VALUES ('Teologia', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Terapia Ocupacional', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Turismo', 'Bacharelado');
INSERT INTO courses (name, type) VALUES ('Zootecnia', 'Bacharelado');
INSERT INTO courses (name) VALUES ('Administração Pública');
INSERT INTO courses (name) VALUES ('Agrimensura');
INSERT INTO courses (name) VALUES ('Agroecologia');
INSERT INTO courses (name) VALUES ('Agronegócios e Agropecuária');
INSERT INTO courses (name) VALUES ('Alimentos');
INSERT INTO courses (name) VALUES ('Análise e Desenvolvimento de Sistemas');
INSERT INTO courses (name) VALUES ('Animação');
INSERT INTO courses (name) VALUES ('Aquicultura');
INSERT INTO courses (name) VALUES ('Artes');
INSERT INTO courses (name) VALUES ('Astronomia');
INSERT INTO courses (name) VALUES ('Automação Industrial');
INSERT INTO courses (name) VALUES ('Banco de Dados');
INSERT INTO courses (name) VALUES ('Biocombustíveis');
INSERT INTO courses (name) VALUES ('Biossistemas');
INSERT INTO courses (name) VALUES ('Biotecnologia');
INSERT INTO courses (name) VALUES ('Biotecnologia e Bioquímica');
INSERT INTO courses (name) VALUES ('Ciência da Terra');
INSERT INTO courses (name) VALUES ('Ciência e Economia');
INSERT INTO courses (name) VALUES ('Ciência e Tecnologia');
INSERT INTO courses (name) VALUES ('Ciência e Tecnologia das Águas/do Mar');
INSERT INTO courses (name) VALUES ('Ciência e Tecnologia de Alimentos');
INSERT INTO courses (name) VALUES ('Ciências Aeronáuticas');
INSERT INTO courses (name) VALUES ('Ciências Agrárias');
INSERT INTO courses (name) VALUES ('Ciências Agrárias');
INSERT INTO courses (name) VALUES ('Ciências da Natureza e suas Tecnologias');
INSERT INTO courses (name) VALUES ('Ciências do Consumo');
INSERT INTO courses (name) VALUES ('Ciências Humanas');
INSERT INTO courses (name) VALUES ('Comércio Exterior');
INSERT INTO courses (name) VALUES ('Computação');
INSERT INTO courses (name) VALUES ('Comunicação das Artes do Corpo');
INSERT INTO courses (name) VALUES ('Comunicação em Mídias Digitais');
INSERT INTO courses (name) VALUES ('Comunicação Institucional');
INSERT INTO courses (name) VALUES ('Comunicação Organizacional');
INSERT INTO courses (name) VALUES ('Conservação e Restauro');
INSERT INTO courses (name) VALUES ('Construção Civil');
INSERT INTO courses (name) VALUES ('Construção Naval');
INSERT INTO courses (name) VALUES ('Cooperativismo');
INSERT INTO courses (name) VALUES ('Cultura, Linguagens e Tecnologias Aplicadas');
INSERT INTO courses (name) VALUES ('Defesa e Gestão Estratégica Internacional');
INSERT INTO courses (name) VALUES ('Design de Games');
INSERT INTO courses (name) VALUES ('Design de Interiores');
INSERT INTO courses (name) VALUES ('Design de Moda');
INSERT INTO courses (name) VALUES ('Ecologia');
INSERT INTO courses (name) VALUES ('Educomunicação');
INSERT INTO courses (name) VALUES ('Eletrônica Industrial');
INSERT INTO courses (name) VALUES ('Eletrotécnica Industrial');
INSERT INTO courses (name) VALUES ('Energia e Sustentabilidade');
INSERT INTO courses (name) VALUES ('Energias Renováveis');
INSERT INTO courses (name) VALUES ('Engenharia Acústica');
INSERT INTO courses (name) VALUES ('Engenharia Biomédica');
INSERT INTO courses (name) VALUES ('Engenharia Bioquímica e de Biotecnologia');
INSERT INTO courses (name) VALUES ('Engenharia de Biossistemas');
INSERT INTO courses (name) VALUES ('Engenharia de Energia');
INSERT INTO courses (name) VALUES ('Engenharia de Inovação');
INSERT INTO courses (name) VALUES ('Engenharia de Segurança no Trabalho');
INSERT INTO courses (name) VALUES ('Engenharia de Sistemas');
INSERT INTO courses (name) VALUES ('Engenharia de Software');
INSERT INTO courses (name) VALUES ('Engenharia de Transporte e da Mobilidade');
INSERT INTO courses (name) VALUES ('Engenharia Hídrica');
INSERT INTO courses (name) VALUES ('Engenharia Industrial Madeireira');
INSERT INTO courses (name) VALUES ('Engenharia Mecatrônica');
INSERT INTO courses (name) VALUES ('Escrita Criativa');
INSERT INTO courses (name) VALUES ('Esporte');
INSERT INTO courses (name) VALUES ('Estética e Cosmética');
INSERT INTO courses (name) VALUES ('Estudos de Gênero e Diversidade');
INSERT INTO courses (name) VALUES ('Estudos de Mídia');
INSERT INTO courses (name) VALUES ('Eventos');
INSERT INTO courses (name) VALUES ('Fabricação Mecânica');
INSERT INTO courses (name) VALUES ('Fotografia');
INSERT INTO courses (name) VALUES ('Gastronomia');
INSERT INTO courses (name) VALUES ('Geofísica');
INSERT INTO courses (name) VALUES ('Geoprocessamento');
INSERT INTO courses (name) VALUES ('Gerontologia');
INSERT INTO courses (name) VALUES ('Gestão Ambiental');
INSERT INTO courses (name) VALUES ('Gestão Comercial');
INSERT INTO courses (name) VALUES ('Gestão da Informação');
INSERT INTO courses (name) VALUES ('Gestão da Produção Industrial');
INSERT INTO courses (name) VALUES ('Gestão da Qualidade');
INSERT INTO courses (name) VALUES ('Gestão da Tecnologia da Informação');
INSERT INTO courses (name) VALUES ('Gestão de Recursos Humanos');
INSERT INTO courses (name) VALUES ('Gestão de Segurança Privada');
INSERT INTO courses (name) VALUES ('Gestão de Seguros');
INSERT INTO courses (name) VALUES ('Gestão de Turismo');
INSERT INTO courses (name) VALUES ('Gestão Desportiva e de Lazer');
INSERT INTO courses (name) VALUES ('Gestão em Saúde');
INSERT INTO courses (name) VALUES ('Gestão Financeira');
INSERT INTO courses (name) VALUES ('Gestão Hospitalar');
INSERT INTO courses (name) VALUES ('Gestão Pública');
INSERT INTO courses (name) VALUES ('História da Arte');
INSERT INTO courses (name) VALUES ('Hotelaria');
INSERT INTO courses (name) VALUES ('Humanidades');
INSERT INTO courses (name) VALUES ('Informática Biomédica');
INSERT INTO courses (name) VALUES ('Investigação Forense e Perícia Criminal');
INSERT INTO courses (name) VALUES ('Irrigação e Drenagem');
INSERT INTO courses (name) VALUES ('Jogos Digitais');
INSERT INTO courses (name) VALUES ('Libras');
INSERT INTO courses (name) VALUES ('Linguagens e Códigos e suas Tecnologias');
INSERT INTO courses (name) VALUES ('Linguística');
INSERT INTO courses (name) VALUES ('Logística');
INSERT INTO courses (name) VALUES ('Luteria');
INSERT INTO courses (name) VALUES ('Manutenção de Aeronaves');
INSERT INTO courses (name) VALUES ('Manutenção Industrial');
INSERT INTO courses (name) VALUES ('Marketing');
INSERT INTO courses (name) VALUES ('Matemática e Computação e suas Tecnologias');
INSERT INTO courses (name) VALUES ('Materiais');
INSERT INTO courses (name) VALUES ('Mecatrônica Industrial');
INSERT INTO courses (name) VALUES ('Mineração');
INSERT INTO courses (name) VALUES ('Musicoterapia');
INSERT INTO courses (name) VALUES ('Nanotecnologia');
INSERT INTO courses (name) VALUES ('Naturologia');
INSERT INTO courses (name) VALUES ('Negócios Imobiliários');
INSERT INTO courses (name) VALUES ('Obstetrícia');
INSERT INTO courses (name) VALUES ('Oceanografia');
INSERT INTO courses (name) VALUES ('Oftálmica');
INSERT INTO courses (name) VALUES ('Optometria');
INSERT INTO courses (name) VALUES ('Papel e Celulose');
INSERT INTO courses (name) VALUES ('Petróleo e Gás');
INSERT INTO courses (name) VALUES ('Pilotagem Profissional de Aeronaves');
INSERT INTO courses (name) VALUES ('Processos Gerenciais');
INSERT INTO courses (name) VALUES ('Processos Metalúrgicos');
INSERT INTO courses (name) VALUES ('Processos Químicos');
INSERT INTO courses (name) VALUES ('Produção Audiovisual');
INSERT INTO courses (name) VALUES ('Produção Cênica');
INSERT INTO courses (name) VALUES ('Produção Cultural');
INSERT INTO courses (name) VALUES ('Produção de Bebidas');
INSERT INTO courses (name) VALUES ('Produção Editorial');
INSERT INTO courses (name) VALUES ('Produção Fonográfica');
INSERT INTO courses (name) VALUES ('Produção Multimídia');
INSERT INTO courses (name) VALUES ('Produção Publicitária');
INSERT INTO courses (name) VALUES ('Produção Sucroalcooleira');
INSERT INTO courses (name) VALUES ('Produção Têxtil');
INSERT INTO courses (name) VALUES ('Psicopedagogia');
INSERT INTO courses (name) VALUES ('Quiropraxia');
INSERT INTO courses (name) VALUES ('Radiologia');
INSERT INTO courses (name) VALUES ('Redes de Computadores');
INSERT INTO courses (name) VALUES ('Rochas Ornamentais');
INSERT INTO courses (name) VALUES ('Saneamento Ambiental');
INSERT INTO courses (name) VALUES ('Saúde');
INSERT INTO courses (name) VALUES ('Saúde Coletiva');
INSERT INTO courses (name) VALUES ('Secretariado');
INSERT INTO courses (name) VALUES ('Segurança da Informação');
INSERT INTO courses (name) VALUES ('Segurança no Trabalho');
INSERT INTO courses (name) VALUES ('Segurança Pública');
INSERT INTO courses (name) VALUES ('Serviços Judiciários e Notariais');
INSERT INTO courses (name) VALUES ('Silvicultura');
INSERT INTO courses (name) VALUES ('Sistemas Biomédicos');
INSERT INTO courses (name) VALUES ('Sistemas de Telecomunicações');
INSERT INTO courses (name) VALUES ('Sistemas Elétricos');
INSERT INTO courses (name) VALUES ('Sistemas Embarcados');
INSERT INTO courses (name) VALUES ('Sistemas para Internet');
INSERT INTO courses (name) VALUES ('Tecnologia da Informação');
INSERT INTO courses (name) VALUES ('Tradutor e Intérprete');
INSERT INTO courses (name) VALUES ('Transporte');
INSERT INTO courses (name) VALUES ('Agrimensura');
INSERT INTO courses (name) VALUES ('Agroecologia');
INSERT INTO courses (name) VALUES ('Agroindústria');
INSERT INTO courses (name) VALUES ('Análise e Desenvolvimento de Sistemas[3]');
INSERT INTO courses (name) VALUES ('Aquacultura');
INSERT INTO courses (name) VALUES ('Bio');
INSERT INTO courses (name) VALUES ('Biocombustíveis');
INSERT INTO courses (name) VALUES ('Biotecnologia');
INSERT INTO courses (name) VALUES ('Cafeicultura');
INSERT INTO courses (name) VALUES ('Ciência dos Alimentos');
INSERT INTO courses (name) VALUES ('Ciências Aeronáuticas');
INSERT INTO courses (name) VALUES ('Ciência dos materiais');
INSERT INTO courses (name) VALUES ('Comércio Exterior');
INSERT INTO courses (name) VALUES ('Construção de Edifícios');
INSERT INTO courses (name) VALUES ('Construção de Estradas');
INSERT INTO courses (name) VALUES ('Construção Naval');
INSERT INTO courses (name) VALUES ('Cooperativismo');
INSERT INTO courses (name) VALUES ('Cosmetologia');
INSERT INTO courses (name) VALUES ('Design de Jogos Digitais');
INSERT INTO courses (name) VALUES ('Design de produto');
INSERT INTO courses (name) VALUES ('Design gráfico');
INSERT INTO courses (name) VALUES ('Drenagem e Irrigação');
INSERT INTO courses (name) VALUES ('Energias Renováveis');
INSERT INTO courses (name) VALUES ('Enologia');
INSERT INTO courses (name) VALUES ('Esporte e Lazer');
INSERT INTO courses (name) VALUES ('Eventos');
INSERT INTO courses (name) VALUES ('Fotografia');
INSERT INTO courses (name) VALUES ('Fruticultura');
INSERT INTO courses (name) VALUES ('Gestão Comercial');
INSERT INTO courses (name) VALUES ('Gestão da Qualidade');
INSERT INTO courses (name) VALUES ('Gestão da Tecnologia da Informação');
INSERT INTO courses (name) VALUES ('Gestão de Petróleo e Gás');
INSERT INTO courses (name) VALUES ('Gestão de Recursos Hídricos');
INSERT INTO courses (name) VALUES ('Gestão de Segurança Privada');
INSERT INTO courses (name) VALUES ('Gestão do Agronegócio');
INSERT INTO courses (name) VALUES ('Gestão em Serviços Jurídicos e Notariais');
INSERT INTO courses (name) VALUES ('Gestão Financeira');
INSERT INTO courses (name) VALUES ('Gestão Hospitalar');
INSERT INTO courses (name) VALUES ('Gestão Portuária');
INSERT INTO courses (name) VALUES ('Horticultura');
INSERT INTO courses (name) VALUES ('Manutenção Industrial');
INSERT INTO courses (name) VALUES ('Meliponicultura');
INSERT INTO courses (name) VALUES ('Mercadologia');
INSERT INTO courses (name) VALUES ('Mineração');
INSERT INTO courses (name) VALUES ('Negócios Imobiliários');
INSERT INTO courses (name) VALUES ('Oftálmica');
INSERT INTO courses (name) VALUES ('Processamento de Dados');
INSERT INTO courses (name) VALUES ('Processos Escolares');
INSERT INTO courses (name) VALUES ('Processos Metalúrgicos');
INSERT INTO courses (name) VALUES ('Produção de Aguardente[4]');
INSERT INTO courses (name) VALUES ('Produção de Laticínios');
INSERT INTO courses (name) VALUES ('Produção de Materiais Plásticos');
INSERT INTO courses (name) VALUES ('Produção Fonográfica');
INSERT INTO courses (name) VALUES ('Produção Sucroalcooeira');
INSERT INTO courses (name) VALUES ('Produção Têxtil');
INSERT INTO courses (name) VALUES ('Projetos de Estruturas Aeronáuticas[5]');
INSERT INTO courses (name) VALUES ('Radiologia');
INSERT INTO courses (name) VALUES ('Recursos Humanos');
INSERT INTO courses (name) VALUES ('Redes de Computadores');
INSERT INTO courses (name) VALUES ('Redes de Telecomunicações');
INSERT INTO courses (name) VALUES ('Secretariado');
INSERT INTO courses (name) VALUES ('Segurança da Informação');
INSERT INTO courses (name) VALUES ('Segurança no Trabalho');
INSERT INTO courses (name) VALUES ('Silvicultura');
INSERT INTO courses (name) VALUES ('Sistemas de Navegação Fluvial');
INSERT INTO courses (name) VALUES ('Sistemas Elétricos');
INSERT INTO courses (name) VALUES ('Sistemas Embarcados');
INSERT INTO courses (name) VALUES ('Sistemas para Internet');
INSERT INTO courses (name) VALUES ('Telemática');
INSERT INTO courses (name) VALUES ('Transporte Aéreo');