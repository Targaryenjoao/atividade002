--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-16 18:27:26 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 32922)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    nm_rua character varying(30) NOT NULL,
    nr_casa numeric(5,4),
    ds_complemnto text,
    nm_bairro character varying(20),
    nm_cidade character varying(20),
    ds_cep text,
    telefone1 integer,
    telefone2 integer,
    cd_endereco integer NOT NULL
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 32928)
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcao (
    cd_funcao integer NOT NULL,
    ds_funcao bit varying(10),
    tp_visivel character(1)
);


ALTER TABLE funcao OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 32931)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    cd_funcionario integer NOT NULL,
    funcao_cd_funcao integer,
    endereco_cd_endereco integer,
    nm_funcionario character varying(20),
    ds_senha character varying(20),
    nick character varying(10),
    tp_visivel character(1)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 32937)
-- Name: ordem__servica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ordem__servica (
    cd_ordem_servico integer NOT NULL,
    funcionario_cd_funcionario integer,
    cliente_cd_cliente integer,
    dt_ordem_servico date,
    vl_total numeric(8,2),
    bool_fechado boolean
);


ALTER TABLE ordem__servica OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 32907)
-- Name: tb clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "tb clientes" (
    cd_cliente integer NOT NULL,
    cd_endereco integer,
    mn_razaosocial character varying(60),
    mn_nomefantasia character varying(30),
    "cod_indentificação" integer,
    ds_email character varying(30)
);


ALTER TABLE "tb clientes" OWNER TO postgres;

--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN "tb clientes".cd_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "tb clientes".cd_cliente IS 'estudar';


--
-- TOC entry 2168 (class 0 OID 32922)
-- Dependencies: 182
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (nm_rua, nr_casa, ds_complemnto, nm_bairro, nm_cidade, ds_cep, telefone1, telefone2, cd_endereco) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 32928)
-- Dependencies: 183
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcao (cd_funcao, ds_funcao, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 32931)
-- Dependencies: 184
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario (cd_funcionario, funcao_cd_funcao, endereco_cd_endereco, nm_funcionario, ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 32937)
-- Dependencies: 185
-- Data for Name: ordem__servica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ordem__servica (cd_ordem_servico, funcionario_cd_funcionario, cliente_cd_cliente, dt_ordem_servico, vl_total, bool_fechado) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 32907)
-- Dependencies: 181
-- Data for Name: tb clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "tb clientes" (cd_cliente, cd_endereco, mn_razaosocial, mn_nomefantasia, "cod_indentificação", ds_email) FROM stdin;
\.


--
-- TOC entry 2037 (class 2606 OID 32941)
-- Name: pk_clien; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tb clientes"
    ADD CONSTRAINT pk_clien PRIMARY KEY (cd_cliente);


--
-- TOC entry 2039 (class 2606 OID 32945)
-- Name: pk_endereco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cd_endereco);


--
-- TOC entry 2041 (class 2606 OID 32953)
-- Name: pk_funcao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT pk_funcao PRIMARY KEY (cd_funcao);


--
-- TOC entry 2045 (class 2606 OID 32955)
-- Name: pk_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2047 (class 2606 OID 32957)
-- Name: pk_ordem_servica; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem__servica
    ADD CONSTRAINT pk_ordem_servica PRIMARY KEY (cd_ordem_servico);


--
-- TOC entry 2035 (class 1259 OID 32951)
-- Name: fki_endereco_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_cliente ON "tb clientes" USING btree (cd_endereco);


--
-- TOC entry 2042 (class 1259 OID 32969)
-- Name: fki_endereco_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_funcionario ON funcionario USING btree (endereco_cd_endereco);


--
-- TOC entry 2043 (class 1259 OID 32963)
-- Name: fki_funcao_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcao_funcionario ON funcionario USING btree (funcao_cd_funcao);


--
-- TOC entry 2049 (class 2606 OID 32980)
-- Name: endereco_cd_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tb clientes"
    ADD CONSTRAINT endereco_cd_endereco FOREIGN KEY (cd_endereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2052 (class 2606 OID 32964)
-- Name: endereco_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT endereco_funcionario FOREIGN KEY (endereco_cd_endereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2048 (class 2606 OID 32946)
-- Name: fk_endereco_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tb clientes"
    ADD CONSTRAINT fk_endereco_cliente FOREIGN KEY (cd_endereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2050 (class 2606 OID 32975)
-- Name: funcao_cd_funcao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT funcao_cd_funcao FOREIGN KEY (cd_funcao) REFERENCES funcionario(cd_funcionario);


--
-- TOC entry 2051 (class 2606 OID 32958)
-- Name: funcao_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcao_funcionario FOREIGN KEY (funcao_cd_funcao) REFERENCES funcao(cd_funcao);


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-16 18:27:26 BRT

--
-- PostgreSQL database dump complete
--

