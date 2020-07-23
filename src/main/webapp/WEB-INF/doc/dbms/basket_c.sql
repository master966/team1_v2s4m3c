/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/

DROP TABLE basket;

CREATE TABLE basket (
    basketno                NUMBER(10)                      NOT NULL       PRIMARY KEY,
    memberno              NUMBER(10)                      NOT NULL,
    p_no                      NUMBER(10)                     NOT NULL,
    p_name                  VARCHAR2(100)                  NOT NULL,
    cnt                        NUMBER(10)                      NOT NULL,
    p_price                 NUMBER(10)                       NOT NULL,
    pay                       NUMBER(10)      DEFAULT 0   NOT NULL,
    thumb1                VARCHAR2(100)                     NOT NULL,
    p_quantity               NUMBER(10)                       NOT NULL,
    basket_date              DATE                                NOT NULL,
    FOREIGN KEY (p_no) REFERENCES product (p_no),
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

DROP SEQUENCE basket_seq;

CREATE SEQUENCE basket_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����
    
COMMENT ON TABLE basket is '��ٱ���';
COMMENT ON COLUMN basket.basketno is '��ٱ��� ��ȣ';
COMMENT ON COLUMN basket.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN basket.p_no is '��ǰ ��ȣ';
COMMENT ON COLUMN basket.p_name is '��ǰ�̸�';
COMMENT ON COLUMN basket.cnt is '��ǰ ����';
COMMENT ON COLUMN basket.p_price is '��ǰ ����';
COMMENT ON COLUMN basket.pay is '��ǰ �� ����';
COMMENT ON COLUMN basket.thumb1 is '��ǰ �����';
COMMENT ON COLUMN basket.p_quantity is '��ǰ ���';
COMMENT ON COLUMN basket.basket_date is '��ٱ��� ��� ����';

INSERT INTO basket(basketno, memberno, p_no, p_name, cnt, p_price, pay, thumb1, p_quantity, basket_date)
VALUES(basket_seq.nextval, 1, 1, '���¿��� ����', 3, 15000, 45000, 'tear.jpg', sysdate);

INSERT INTO basket(basketno, memberno, p_no, p_name, cnt, p_price, pay, thumb1, p_quantity, basket_date)
VALUES(basket_seq.nextval, 1, 2, '���¿��� ��ġ', 2, 6800, 13600, 'nunchi.jpg', sysdate);

INSERT INTO basket(basketno, memberno, p_no, p_name, cnt, p_price, pay, thumb1, p_quantity, basket_date)
VALUES(basket_seq.nextval, 1, 3, '���¿��� ����', 5, 4600, 23000, 'smile.jpg', sysdate);
commit;


SELECT * FROM basket;

DELETE FROM basket
WHERE memberno = 1;