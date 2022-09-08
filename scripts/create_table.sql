-- CREATE TABLE IF NOT EXISTS data_product (
--     id INT PRIMARY KEY,
--     name TEXT,
--     status TEXT
-- );

-- ALTER TABLE data_product REPLICA IDENTITY FULL;

-- INSERT INTO data_product VALUES (1, 'notebook', 'PROVISIONADO');
-- INSERT INTO data_product VALUES (2, 'sql', 'PROCESSANDO');
-- INSERT INTO data_product VALUES (3, 'notebook', 'PROCESSANDO');
-- INSERT INTO data_product VALUES (4, 'sql', 'PROCESSANDO');
-- INSERT INTO data_product VALUES (5, 'notebook', 'PROCESSANDO');
-- INSERT INTO data_product VALUES (6, 'sql', 'PROCESSANDO');
-- INSERT INTO data_product VALUES (7, 'notebook', 'PROCESSANDO');
-- INSERT INTO data_product VALUES (8, 'sql', 'PROCESSANDO');



-- public.data_product_entity definition

CREATE TABLE public.data_product_entity (
	id varchar(36) NOT NULL GENERATED ALWAYS AS (((json ->> 'id'::text))) STORED,
	fullyqualifiedname varchar(256) NOT NULL GENERATED ALWAYS AS (((json ->> 'fullyQualifiedName'::text))) STORED,
	json jsonb NOT NULL,
	updatedat int8 NOT NULL GENERATED ALWAYS AS ((json ->> 'updatedAt'::text)::bigint) STORED,
	updatedby varchar(256) NOT NULL GENERATED ALWAYS AS (((json ->> 'updatedBy'::text))) STORED,
	deleted bool NULL GENERATED ALWAYS AS ((json ->> 'deleted'::text)::boolean) STORED,
	CONSTRAINT data_product_entity_fullyqualifiedname_key UNIQUE (fullyqualifiedname),
	CONSTRAINT data_product_entity_pkey PRIMARY KEY (id)
);

ALTER TABLE data_product_entity REPLICA IDENTITY FULL;

INSERT INTO data_product VALUES (1, 'fullyqualifiedname', {"type_dp": "notebook", "owner": "anapalopes", "name": "test_dt_product", "description": "Testando a criação de repositorio"}, '2022-09-07', '2022-09-07', false);
