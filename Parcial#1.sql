PGDMP                         y            Parcial1    13.3    13.3 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    33110    Parcial1    DATABASE     i   CREATE DATABASE "Parcial1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Parcial1";
                postgres    false            �            1255    33203    log_employeecaudit_action()    FUNCTION     �  CREATE FUNCTION public.log_employeecaudit_action() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
insert into employeeaudit 
   values (1,'Maria Ana', 'oficina 20', 'Ingeniería', 'Cristian', 'uno', 'kra 12#23-12','Bogotá','Colombia','Informatico', '16/09/2021');
   
	/*IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;*/

	RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.log_employeecaudit_action();
       public          postgres    false            �            1255    33212    log_employeecaudit_insert()    FUNCTION     (  CREATE FUNCTION public.log_employeecaudit_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
insert into employeeaudit 
   values (1,'Maria Ana', 'oficina 20', 'Ingeniería', 'Cristian', 'insert', 'kra 12#23-12','Bogotá','Colombia','Informatico', '16/09/2021');
	RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.log_employeecaudit_insert();
       public          postgres    false            �            1255    33214    log_employeecaudit_update()    FUNCTION     (  CREATE FUNCTION public.log_employeecaudit_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
insert into employeeaudit 
   values (1,'Maria Ana', 'oficina 20', 'Ingeniería', 'Cristian', 'update', 'kra 12#23-12','Bogotá','Colombia','Informatico', '16/09/2021');
	RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.log_employeecaudit_update();
       public          postgres    false            �            1259    33129    employee    TABLE     $  CREATE TABLE public.employee (
    "employeeId" integer NOT NULL,
    "fullName" character varying(250) NOT NULL,
    "branchId" integer NOT NULL,
    "departmentId" integer NOT NULL,
    "positionId" integer NOT NULL,
    "addressId" integer NOT NULL,
    "supervisorId" integer NOT NULL
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    33216 	   Historico    VIEW     �   CREATE VIEW public."Historico" AS
 SELECT employee."employeeId",
    employee."fullName",
    employee."branchId",
    employee."departmentId",
    employee."positionId",
    employee."addressId",
    employee."supervisorId"
   FROM public.employee;
    DROP VIEW public."Historico";
       public          postgres    false    205    205    205    205    205    205    205            �            1259    33111    address    TABLE     �   CREATE TABLE public.address (
    "addressId" integer NOT NULL,
    line1 character varying(250) NOT NULL,
    line2 character varying(250) NOT NULL,
    "cityId" integer NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    33117    branchoffice    TABLE     �   CREATE TABLE public.branchoffice (
    "branchId" integer NOT NULL,
    name character varying(250) NOT NULL,
    "addressId" integer NOT NULL
);
     DROP TABLE public.branchoffice;
       public         heap    postgres    false            �            1259    33120    city    TABLE     �   CREATE TABLE public.city (
    "cityId" integer NOT NULL,
    name character varying(250) NOT NULL,
    "countryId" integer NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    33123    country    TABLE     l   CREATE TABLE public.country (
    "countryId" integer NOT NULL,
    name character varying(250) NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    33126 
   department    TABLE     r   CREATE TABLE public.department (
    "departmentId" integer NOT NULL,
    name character varying(250) NOT NULL
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    33132    employeeaudit    TABLE     �  CREATE TABLE public.employeeaudit (
    "employeeId" integer,
    "fullName" character varying(250),
    "branchOffice" character varying(250),
    department character varying(250),
    supervisor character varying(250),
    "position" character varying(250),
    address character varying(250),
    city character varying(250),
    country character varying(250),
    event character varying(250),
    "registeredAt" date
);
 !   DROP TABLE public.employeeaudit;
       public         heap    postgres    false            �            1259    33138    position    TABLE     p   CREATE TABLE public."position" (
    "positionId" integer NOT NULL,
    name character varying(250) NOT NULL
);
    DROP TABLE public."position";
       public         heap    postgres    false            �          0    33111    address 
   TABLE DATA           F   COPY public.address ("addressId", line1, line2, "cityId") FROM stdin;
    public          postgres    false    200   �4       �          0    33117    branchoffice 
   TABLE DATA           E   COPY public.branchoffice ("branchId", name, "addressId") FROM stdin;
    public          postgres    false    201   	<       �          0    33120    city 
   TABLE DATA           ;   COPY public.city ("cityId", name, "countryId") FROM stdin;
    public          postgres    false    202   �>       �          0    33123    country 
   TABLE DATA           4   COPY public.country ("countryId", name) FROM stdin;
    public          postgres    false    203   �B       �          0    33126 
   department 
   TABLE DATA           :   COPY public.department ("departmentId", name) FROM stdin;
    public          postgres    false    204   UF       �          0    33129    employee 
   TABLE DATA           �   COPY public.employee ("employeeId", "fullName", "branchId", "departmentId", "positionId", "addressId", "supervisorId") FROM stdin;
    public          postgres    false    205   >H       �          0    33132    employeeaudit 
   TABLE DATA           �   COPY public.employeeaudit ("employeeId", "fullName", "branchOffice", department, supervisor, "position", address, city, country, event, "registeredAt") FROM stdin;
    public          postgres    false    206   9P       �          0    33138    position 
   TABLE DATA           8   COPY public."position" ("positionId", name) FROM stdin;
    public          postgres    false    207   �P       F           2606    33142    address address_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY ("addressId");
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    200            H           2606    33144    branchoffice branchoffice_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.branchoffice
    ADD CONSTRAINT branchoffice_pkey PRIMARY KEY ("branchId");
 H   ALTER TABLE ONLY public.branchoffice DROP CONSTRAINT branchoffice_pkey;
       public            postgres    false    201            J           2606    33146    city city_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY ("cityId");
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    202            N           2606    33150    department department_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY ("departmentId");
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    204            P           2606    33152    employee employeeID_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "employeeID_pkey" PRIMARY KEY ("employeeId");
 D   ALTER TABLE ONLY public.employee DROP CONSTRAINT "employeeID_pkey";
       public            postgres    false    205            L           2606    33197    country pk_countryId 
   CONSTRAINT     ]   ALTER TABLE ONLY public.country
    ADD CONSTRAINT "pk_countryId" PRIMARY KEY ("countryId");
 @   ALTER TABLE ONLY public.country DROP CONSTRAINT "pk_countryId";
       public            postgres    false    203            R           2606    33154    position position_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY ("positionId");
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    207            [           2620    33213    employee trg_i_employee    TRIGGER     �   CREATE TRIGGER trg_i_employee AFTER INSERT ON public.employee FOR EACH ROW EXECUTE FUNCTION public.log_employeecaudit_insert();
 0   DROP TRIGGER trg_i_employee ON public.employee;
       public          postgres    false    205    210            \           2620    33215    employee trg_u_employee    TRIGGER     �   CREATE TRIGGER trg_u_employee AFTER UPDATE ON public.employee FOR EACH ROW EXECUTE FUNCTION public.log_employeecaudit_update();
 0   DROP TRIGGER trg_u_employee ON public.employee;
       public          postgres    false    211    205            V           2606    33155    employee addressId    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "addressId" FOREIGN KEY ("addressId") REFERENCES public.address("addressId") NOT VALID;
 >   ALTER TABLE ONLY public.employee DROP CONSTRAINT "addressId";
       public          postgres    false    205    2886    200            T           2606    33160    branchoffice address_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.branchoffice
    ADD CONSTRAINT address_fk FOREIGN KEY ("addressId") REFERENCES public.address("addressId");
 A   ALTER TABLE ONLY public.branchoffice DROP CONSTRAINT address_fk;
       public          postgres    false    200    2886    201            W           2606    33165    employee branchId    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "branchId" FOREIGN KEY ("branchId") REFERENCES public.branchoffice("branchId") NOT VALID;
 =   ALTER TABLE ONLY public.employee DROP CONSTRAINT "branchId";
       public          postgres    false    205    2888    201            S           2606    33170    address city_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.address
    ADD CONSTRAINT city_fk FOREIGN KEY ("cityId") REFERENCES public.city("cityId") NOT VALID;
 9   ALTER TABLE ONLY public.address DROP CONSTRAINT city_fk;
       public          postgres    false    200    2890    202            X           2606    33180    employee department_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT department_fk FOREIGN KEY ("departmentId") REFERENCES public.department("departmentId") NOT VALID;
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT department_fk;
       public          postgres    false    204    205    2894            U           2606    33198    city fk_countryId    FK CONSTRAINT     �   ALTER TABLE ONLY public.city
    ADD CONSTRAINT "fk_countryId" FOREIGN KEY ("countryId") REFERENCES public.country("countryId") NOT VALID;
 =   ALTER TABLE ONLY public.city DROP CONSTRAINT "fk_countryId";
       public          postgres    false    2892    203    202            Y           2606    33185    employee position_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT position_fk FOREIGN KEY ("positionId") REFERENCES public."position"("positionId") NOT VALID;
 >   ALTER TABLE ONLY public.employee DROP CONSTRAINT position_fk;
       public          postgres    false    2898    207    205            Z           2606    33190    employee supervisor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT supervisor_fk FOREIGN KEY ("employeeId") REFERENCES public.employee("employeeId") NOT VALID;
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT supervisor_fk;
       public          postgres    false    2896    205    205            �   o  x�mW�n�<�_A W� �d�}��x���v������#G#��S���q@�lVUW�8uw���y���/��l�M��s�k/��t��,	+����6�������Ry
��6��H���������u6a=�u'Xgo~��xa6u��S���GR^��z��C`��������Y��RRv��u�N�2	��u֞j�ڝ"+e��X�&��<�ᲮBTQ����ʅ	ͧ��=���>;lsV9o������M#��c��0@��)���nAk��Ku��M�����ʙ������R|�1�>G�8es5��?�*iWd���̀���[K^DkNm�92�i)�9�r8�U�ܐ��|h�m�}!h�IY�@F��@v �9%��x����?����vY�� x�N�ٺ�
Q.Rc�Y
$��K�[��R������O s*s�j_o����[���e1�������hf���U~�6!8o�׾;,[B�<X}h_Q�7>9We���(�1n\�>Es��Q�pD6ťVL�I�m�]j��h��gȓxʲ�BE4�g,9�{<�I279'�Z{A!(�j��|�е�Q�{o�5��^|,+V��J�'���Ϲ�jEL9�B=y��61�����v��ؽ��}�R�&zg?���K�O�W��^� !�H.������RpUT�|C��1-T� ���0�}^��	<�W�iO$�v�����c�$���ؙ+Ɓ����K7-^�b���������X@Yyr⦨��ћ�y�Z�%Ȯ�\��}���
��	��eK�ӑ�Yn�C�V�e�,��p$�xa@���n_�d�4)��F�v{�/��u����:��^ã ����o�i�ݩ���&=�Vt�Z �m��C7?��& a����w�79��-f7�
.�-��|�%��7�b�)�3��~�^�U��#�	<^t�pP��:7�~��P��!X��}?7���h�b�� �'£;�!�BJ����y��t�+-+C>�FB��j�e��U`��Z�
YS ���Q�5���ar0�c�߯����.1�W	���������A�<�S��a��>��g&$���>{@���ۗ�0�p-����pNV� �O�Ǖ�/��F?.t��R�h6����*(z��c�V����ݢ�$a����\������j�wlP s����E56��ކ����V�Q��
g� �mfؔ� ��f�� 7���N²	>�y�P�c���@��=Jl�5$`%�W�MR��'z��	�O*�yIo��dw��0� ��s�!�?������m���6�7#�@�����>�N��G\��BED	����yã	f~���i�#Ԋ~�	&b�� �v�Kw�@�b�)cz�yA	�б����Я�lQ
^��yg"�
0��Z��"j�sa6�o��خ#�����vY�[��|+�
Z��Y�~f ������cԧ���.ÝM�\=w�LL�T�:crȰ2����$ݢ�?p��`T8MH�.|\����*�ܶ�-$2��3�	�H�u��	p��v�L�[�p X2:3W�����ױ���\e�]�<JD��nZt|�E�c�̫j	6�?@Z������u>3m�'İP�r�?���`��ՂHPi9mۿ�As��������β�fQ���%m(c�h��m����8���s���ˬ��P�xJY^���;D� Sx��ĽE�"P� �S�
e����a	KҎ���1�2�XM �e{�����ٮ�dX���Rli���H�ti����>���������(�Ѷ��$�K�bR&1�j�f\�_D>�)oy���d�Ɩ!28k��ʔ�I�n��X�"��>�FN��Rk�7��)�      �   �  x�mT�R�0<k�"_�e���B��*(��\�"�*;똢����tK�3�����l=��u��
��eҒ8��d7i��{�)v޵u����ڴBX)�Y��d�Y������ɲ�S���*�Y�u��W��ʴ ����]�u��]N�*�Ӟ8g?~=gBy3.�Kv���π�.C�����B��6�}x��s�PU����;�R�mS,R<�L�ؐ)G�b7!���͐�좉� |)��#"J�<��Mأ0�{�*�]�}I��$�h��g\��l6qx[]o6��fH�5��b8	��b�0A�g�k��8��x mI�Ԁ��7}zxa$�!)K T�I���0�w�x\��%m�9��9�}��$UM����C#����D(��pHS����Pr󲽟d��q�^����Cʱ[V�8�9P��%��@�|�����gߵ�9ܒ�J��l���Z���g�	�8L/�K�.[��/���T�mJN��AFd���ȅ���Q�݂H�����1��<)dh\�(@4�]��y����0��UI ��ŢY1_%�h�M:,���C4xS��pIְ�MxO�ܶ�'\Ⱥ�?0o����B	��O��=9q���dџ495�#7�t��'�;�9�S��?9}�ռi��S�r��A�߂]�����`�����`��ȳS�?�����y����ͤ�?_��HK�      �     x��UMS�8=w�
�*�e}X��	�b!,Cت�^4���bK�,������	9���ju�~�����ŭ����ߍ���%��d��!��?�˷�(�rr��)a��<L���A����B����>�~_��-NMr��ŹK�C�S���[�Z|�fy���'�Y	k�|*nLL����Ƶ1x;� ��Ӵ5=a`���dp2	�nk#�Y7��]�W�"�ϙ��˧k��X��o�w7B�����
cȚ�h����cg����@�!��!vNq�o݋� '�s9��d)-�p?�Ԉ/.lg#Q��B.(�w�8r	�a�;ʧ
��`c3�f**��-���)���d�=p�m�2Zo:�(�_̆�	�����p���X������(Q�c�|�tOѥ�B����hF�t�	wk��N��AQ��θ�$�.(W�+��aԬFY������(�ؠ���2�R�U��z��l2W� k���<%�6�G����yT;[z �� %J�s�~�>�Q6�0��*�g�]�~L6k��*O�7�Y�V|){�l���d1��U>m�/	d���e3W�l�O���J�Ug6S��J������*Cއ�,�On�ҮX=�y�$���F`RfR�pG'���SR�4��Y�J���G�_m6CUQ�g7w�R�eȪԨ4|}�ă����KϜ�4o=_;���P��@L*���?٠.��.m '3�������H;oKYI�l�ҜZ��֌mn��;%5j�~Ɗ\��6���R����RE����M�xKU���zz5.��P�LJ^ZbM����6�ɯI�fp����8��6��ɵ�=�qz��5����k&�BI*[�1Y7u��(J�s�|֋��v�ƑFNS�Ԟ�����*�5i�ʙ�-(�M��kIl|��h2l�l-C#��l�n=����US���0unVt�k����L߻��^Li��25�w���¦�K���{���/~>���G;�6g[�ۗi���?��F����!ת5��;"����      �   Z  x��T�r�F<�|��*U�xG��dŒ�1iR����K/�(��C�c�%)�l�R9a��ٞh)�Fc��Z�2j�8�{]�u���b�)}6zT��sF�Ō�s�֝9h.�Q��_�tb[.�A�Q��w�$����'��4�QDw^�p�'�n���è��(��7ִ�*dQkW��q����V-]��z0ȑ���-�szpv㺰\��u�wV���QI��--v+��P^����ZP���-������\p���'������x_{���{3:oB��n�{.P�V�PV���-Qlcv��%��͗	%�;��A��ч��A�����5�R��dF��"���D1��KZ�����<�a���^���M�3���uWj>4ɀ֣.��C�����Ap<��"�h��8��'kFݪ�nZ׫� ���$!���F�19�i1y��Oq�&��O�I����h@I��P�ldh�s
�����5��1+-Q�����mY�,��p�;�e3a1v�7�=g0��C���u/�Y8˾1j!_�`�^�
ZH���Yy�e��W
�P?��5^ S}Ի������y@�w�0�\�c�������<l��<�k8�w�N��_˜�&�%���Z��l�N��W���b3��莋��7��5W�,����*��O\���4�C��]�������O����-`��qQ�rk:�۝�J�O��%4r��_��n�=���~��e�
��Y�>�����7�c����Wo�OM8V�b<\��<��5�֮�v����TU���7�=�����i�{d�
L���JZ�y	� �(欩�$�`�]&��?0���P�x      �   �  x�}U�n�0<�_�/(�7y=4@��+/\��d����}U0E�B�}�G+���c;�\��%��R�C��i�\��fo���6Y�~,q���)�%��㖈9�
�>n:=��84/p�i>�8��q����ؼ���~<qѲw�S��y�+���!{�i.$ݽ�/t!x�t�W`��L���e���0b�ٷ�ǕW��t[p�ܡ [e�y�<�|�䝖T;����֒�r�LiMYR�v���a�^��]jE|�B��|�Ȫn��U�)-~�H7>�T�¢[,�ۭ�H��Akb�!b��&L�=2��7�%�.A�d��QX;��Fc�F�YW>��R����jE�J�P���ҷ�bY-i��h�ѹ���)q;E�r������-����]�2yBr/�Q��I����r5<�kOH���+�+�,r�dA���u nw��>�%�5�9���m��}����_�      �   �  x�5��nܼǯ�O�h�:K�>�vY�F�~���wkŀ��*O���-`�$����f��m�v�'�a�"m'e#e'�N��r�b�sv�Ӿ��� m.u/]+M!yeJy���ͻq��v٤��h��I�KӚJ�ë�n��^��+�W�+�*)sS�?��m�b��d?�/��$塞��4�}}�.�sg��w>�������v���mlv����~Y��K^KӘN�N����<�阊/�饡>�˷�d�����%ϥ��  ��L���n���x�,<�i[
^)o_S�]v�'7�I�nSu]ë&/���e_�_'��n��������R�q˾Q\S�w`D�ea����B�G;.R�I_kukh���vt.���D��y�?ue�F^��ݐ�8'�ip���Zyp���q���^������jϮ����PA!-���R�#D�Q� �M���� �[A$6{��`ϳ�A��&�Q˽=����NR�!PH�Ig��!���d�qQ�j���X�@���0�f��n:8i�R*�
�@��3D�����O��R�L#Mm��>����6:7͋����q'��ȕ�?d�aY\�8�I]��Pھ�[��p{	�5�V��ɗ����Z���^e�!Kn��a=p,�F<�uvRUI�8:ïO�Ӻ�.f��`���*�
o�r1�栨��V��I�㧮MY��ptq���x���F/)ל;�5DO{7��$�Rym�&����g�^c��w��Û��ިycq�v��l��$}��puS�G��a�&�d�c	�*�' �;�� ���?F���D��:���}{�&Y�OA�>�ū�ȅ&���o8���j��� �s��H�k	􉷀�RuN�.g�IR�4l��0��-�1�tv]�3��;��N�,�.&�M\vc=H,R��1bWD�{Gy�� '�&��d�K��p|�mb����9�Q�@أ���vZ~�4e� �;���C����9�!_i
諼�!ٿ�i�C|װ�;-N��T:�v�rR*w��VO�Zuah�Rsrڲ��,�D)1�Oۛ�Ĵ1:.����-1�)�R�b�y0V��T����(Iu�uN�=�V�1h]�H��f7~>	����:�(��;���b�Y��;�R�'�\�3���KQ�H�F�����<-�M��iR�RN�gI}�<���:1+��,�������t�_�.���(�U��B�V�ŋ�P�| &M�"�W��yZ�d��#c���$�\[4L�[ܶ��'�a�K21�	��� ���p�W����^;������.'F�?�Y'��G�S��*ܞ�\�;h���JO����f£�F�<��������'׌	�=OZ�P�����R�N?jyD >��:���oe���=Di~X�+�6ߡZ�Mi�?/t}mϨ��X��!���|�rC����;��p�N�4���{C���羒�nT�c�*C[$�l�g�]۰.���$O3�6��eXmdh=T� �v�J����}�p�]u��5����7+����D#+r�!}P���I�t�
��������0�z����'u�����_��K!�3�ՉT�f/�ѝ�O�'Z��R�������4��g�MK�򘷆?~9{]?n��p$�:�p����Ǹ-��#��PI�p9�<�?��h�.�U����xEUN�X,�@<����Ew�J)�5D����Һw���v��Wm5\�|F1>���1Da
c��G+� ��:�6��;��n1���b��p����d�غ�,|C�N�?��!p~�r�G���L���iN���:ʦإ,�S
����I��V���3�?m{���i	kԑ���4�����ޡ�u&!��9�S�~�=Ln����/����e��ަ�0��=[Q~�� p����]e��=)Kadh��jU�S�3`�T��ݛN�*-d�r~t��[v��(�j�6uN=�,5� �޳&ߥ��Ss���O���&P�\ � S��J�cf����N��������6���1�<�.X      �   u   x�3��M,�LTp�K��O�L��KT02���KO��L-:�6�ӹ(��$31��4/�3�(Q��H��X�Ј�)?=���BN����ܤ�D������Ē��|N##C]K]C3.CzX���� [�Ao      �   f  x��U�r�6>/�O��H�G�v�4�e�K/0I��������(�h��%����.R�x�׾w��+#��Nw���Qʑ�l�骮mo�4��N�=�Ӯ���{C[i�o0Xu����>9�S��H�?�J�����osi�ک�[G�nd�:"`cw��t��P���0]�
V�B�7�&���N�-�9c�t�&i
�T}�F�v�Q�FX��I;kZ�X,QH�ß��I��!)�����;�i�
�6��$-��i�4-���rxQ�#��26$0���.���7Co�+W��$$C|��T^�=�62�ecٓj��\7�᫒�? 
Y0�1s���ne4v����$��x&�.��n����B?�mo���w*��(̓w�+����"4d�gG�g�I���Dr(s���<)���H�$��$q �^6$7�ȃ\[-/��,��O���R����������d�ຩ���|�'��P����>�����a�ջNV��Ǌb���V�d�a#w
��FK�L�<�%�'���$�v���i�H�.�_d��ɍ���Y�h���F�gR��{����%=*<"���+*Ħ�Z"%:�v�s�T��.e��6�o�8/�9-s�F�2x��t�bב�J���U�m��[M@У��.+|Q�����Ҋ�	���1`V�M��]�cm'u��ߘl� ���#��ǣu>r��K/_e���t��]�	�0��x���hU�+���1���Kd�ur����#����t�\����@Ft�^kQ-p�L�d���[�}ЂT)jY7x�>�_H��p��{?H�OS��l5R�#U0��bت�P��3:Rq�k����\	�N��%M����'Bȿ�D��     