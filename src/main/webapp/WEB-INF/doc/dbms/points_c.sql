/**********************************/
/* Table Name: ����Ʈ ����/��� */
/**********************************/
DROP TABLE points;

CREATE TABLE points(
    pointsno              NUMBER(10)  NOT NULL  PRIMARY KEY,
    memberno            NUMBER(10) NOT NULL,
    ordersno              NUMBER(10) NOT NULL,
    contents              VARCHAR(50) NOT NULL,
    point_change         NUMBER(10)  NOT NULL,
    points_date            DATE           NOT NULL,
    FOREIGN KEY (memberno) REFERENCES members (memberno),
    FOREIGN KEY (ordersno) REFERENCES orders (ordersno)
);

INSERT INTO points(pointsno, memberno, ordersno, contents, point_change, points_date)
VALUES(points_seq.nextval, 1, 1, '���¿��� ����', 2300, sysdate);

DROP SEQUENCE points_seq;

CREATE SEQUENCE points_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����


SELECT points_date FROM points;

SELECT pointsno, memberno, ordersno, contents, point_change, points_date, r
    FROM (
        SELECT pointsno, memberno, ordersno, contents, point_change, points_date, rownum as r
        FROM points)
    WHERE r >0 AND r <= 2;

COMMENT ON TABLE points is '����Ʈ';
COMMENT ON COLUMN points.poinstno is '����Ʈ ��ȣ';
COMMENT ON COLUMN points.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN points.ordersno is '������ȣ';
COMMENT ON COLUMN points.contents is '����';
COMMENT ON COLUMN points.point_change is '����Ʈ �����ݾ�';
COMMENT ON COLUMN points.points_date is '����Ʈ ������';

commit;