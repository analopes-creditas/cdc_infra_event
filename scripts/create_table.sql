CREATE TABLE IF NOT EXISTS data_product (
    id INT PRIMARY KEY,
    name TEXT,
    status TEXT
);

ALTER TABLE data_product REPLICA IDENTITY FULL;

INSERT INTO data_product VALUES (1, 'notebook', 'PROVISIONADO');
INSERT INTO data_product VALUES (2, 'sql', 'PROCESSANDO');
INSERT INTO data_product VALUES (3, 'notebook', 'PROCESSANDO');
INSERT INTO data_product VALUES (4, 'sql', 'PROCESSANDO');
INSERT INTO data_product VALUES (5, 'notebook', 'PROCESSANDO');
INSERT INTO data_product VALUES (6, 'sql', 'PROCESSANDO');
INSERT INTO data_product VALUES (7, 'notebook', 'PROCESSANDO');
INSERT INTO data_product VALUES (8, 'sql', 'PROCESSANDO');
