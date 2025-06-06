PGDMP       4                }            sistema_pedidos    17.5    17.5 '    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            7           1262    24752    sistema_pedidos    DATABASE     �   CREATE DATABASE sistema_pedidos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE sistema_pedidos;
                     postgres    false                        3079    24861 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                        false            8           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                             false    2            �            1259    24825 	   avaliacao    TABLE     �  CREATE TABLE public.avaliacao (
    id_avaliacao character varying(36) NOT NULL,
    nota integer,
    comentario text,
    id_pedido character varying(36) NOT NULL,
    tipo_avaliacao character varying(20),
    CONSTRAINT avaliacao_nota_check CHECK (((nota >= 1) AND (nota <= 5))),
    CONSTRAINT avaliacao_tipo_avaliacao_check CHECK (((tipo_avaliacao)::text = ANY ((ARRAY['cliente'::character varying, 'entregador'::character varying])::text[])))
);
    DROP TABLE public.avaliacao;
       public         heap r       postgres    false            �            1259    24753    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente character varying(36) NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    telefone character varying(15)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    24760    endereco    TABLE     D  CREATE TABLE public.endereco (
    id_endereco character varying(36) NOT NULL,
    rua character varying(100) NOT NULL,
    numero integer NOT NULL,
    cidade character varying(50) NOT NULL,
    estado character varying(50) NOT NULL,
    complemento character varying(100),
    id_cliente character varying(36) NOT NULL
);
    DROP TABLE public.endereco;
       public         heap r       postgres    false            �            1259    24785 
   entregador    TABLE     �   CREATE TABLE public.entregador (
    id_entregador character varying(36) NOT NULL,
    nome character varying(100) NOT NULL,
    veiculo character varying(50)
);
    DROP TABLE public.entregador;
       public         heap r       postgres    false            �            1259    24810    itens_pedido    TABLE     �   CREATE TABLE public.itens_pedido (
    id_item character varying(36) NOT NULL,
    id_pedido character varying(36) NOT NULL,
    id_produto character varying(36) NOT NULL,
    quantidade integer NOT NULL
);
     DROP TABLE public.itens_pedido;
       public         heap r       postgres    false            �            1259    24790    pedido    TABLE     7  CREATE TABLE public.pedido (
    id_pedido character varying(36) NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    status character varying(20) NOT NULL,
    id_cliente character varying(36) NOT NULL,
    id_restaurante character varying(36) NOT NULL,
    id_entregador character varying(36)
);
    DROP TABLE public.pedido;
       public         heap r       postgres    false            �            1259    24775    produto    TABLE     �   CREATE TABLE public.produto (
    id_produto character varying(36) NOT NULL,
    nome character varying(100) NOT NULL,
    preco numeric(10,2) NOT NULL,
    id_restaurante character varying(36) NOT NULL
);
    DROP TABLE public.produto;
       public         heap r       postgres    false            �            1259    24770    restaurante    TABLE     �   CREATE TABLE public.restaurante (
    id_restaurante character varying(36) NOT NULL,
    nome character varying(100) NOT NULL,
    categoria character varying(50),
    endereco character varying(150)
);
    DROP TABLE public.restaurante;
       public         heap r       postgres    false            1          0    24825 	   avaliacao 
   TABLE DATA           ^   COPY public.avaliacao (id_avaliacao, nota, comentario, id_pedido, tipo_avaliacao) FROM stdin;
    public               postgres    false    225   2       *          0    24753    cliente 
   TABLE DATA           D   COPY public.cliente (id_cliente, nome, email, telefone) FROM stdin;
    public               postgres    false    218   �D       +          0    24760    endereco 
   TABLE DATA           e   COPY public.endereco (id_endereco, rua, numero, cidade, estado, complemento, id_cliente) FROM stdin;
    public               postgres    false    219   �S       .          0    24785 
   entregador 
   TABLE DATA           B   COPY public.entregador (id_entregador, nome, veiculo) FROM stdin;
    public               postgres    false    222   �h       0          0    24810    itens_pedido 
   TABLE DATA           R   COPY public.itens_pedido (id_item, id_pedido, id_produto, quantidade) FROM stdin;
    public               postgres    false    224   Ps       /          0    24790    pedido 
   TABLE DATA           i   COPY public.pedido (id_pedido, data_hora, status, id_cliente, id_restaurante, id_entregador) FROM stdin;
    public               postgres    false    223   U�       -          0    24775    produto 
   TABLE DATA           J   COPY public.produto (id_produto, nome, preco, id_restaurante) FROM stdin;
    public               postgres    false    221   x�       ,          0    24770    restaurante 
   TABLE DATA           P   COPY public.restaurante (id_restaurante, nome, categoria, endereco) FROM stdin;
    public               postgres    false    220   b�       �           2606    24833    avaliacao avaliacao_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (id_avaliacao);
 B   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT avaliacao_pkey;
       public                 postgres    false    225            �           2606    24759    cliente cliente_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_email_key;
       public                 postgres    false    218            �           2606    24757    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    218            �           2606    24764    endereco endereco_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public                 postgres    false    219            �           2606    24789    entregador entregador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.entregador
    ADD CONSTRAINT entregador_pkey PRIMARY KEY (id_entregador);
 D   ALTER TABLE ONLY public.entregador DROP CONSTRAINT entregador_pkey;
       public                 postgres    false    222            �           2606    24814    itens_pedido itens_pedido_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (id_item);
 H   ALTER TABLE ONLY public.itens_pedido DROP CONSTRAINT itens_pedido_pkey;
       public                 postgres    false    224            �           2606    24794    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public                 postgres    false    223            �           2606    24779    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public                 postgres    false    221            �           2606    24774    restaurante restaurante_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT restaurante_pkey PRIMARY KEY (id_restaurante);
 F   ALTER TABLE ONLY public.restaurante DROP CONSTRAINT restaurante_pkey;
       public                 postgres    false    220            �           2606    24834 "   avaliacao avaliacao_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);
 L   ALTER TABLE ONLY public.avaliacao DROP CONSTRAINT avaliacao_id_pedido_fkey;
       public               postgres    false    4748    225    223            �           2606    24765 !   endereco endereco_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 K   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_id_cliente_fkey;
       public               postgres    false    4738    218    219            �           2606    24815 (   itens_pedido itens_pedido_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);
 R   ALTER TABLE ONLY public.itens_pedido DROP CONSTRAINT itens_pedido_id_pedido_fkey;
       public               postgres    false    223    4748    224            �           2606    24820 )   itens_pedido itens_pedido_id_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produto(id_produto);
 S   ALTER TABLE ONLY public.itens_pedido DROP CONSTRAINT itens_pedido_id_produto_fkey;
       public               postgres    false    224    221    4744            �           2606    24795    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       public               postgres    false    4738    223    218            �           2606    24805     pedido pedido_id_entregador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_entregador_fkey FOREIGN KEY (id_entregador) REFERENCES public.entregador(id_entregador);
 J   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_entregador_fkey;
       public               postgres    false    4746    223    222            �           2606    24800 !   pedido pedido_id_restaurante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_restaurante_fkey FOREIGN KEY (id_restaurante) REFERENCES public.restaurante(id_restaurante);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_restaurante_fkey;
       public               postgres    false    4742    223    220            �           2606    24780 #   produto produto_id_restaurante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_id_restaurante_fkey FOREIGN KEY (id_restaurante) REFERENCES public.restaurante(id_restaurante);
 M   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_id_restaurante_fkey;
       public               postgres    false    221    220    4742            1      x�e�I�d�R�ǧV�X�#��|��&�*�G��c?���EAF��R��ʌǭ���)�?����������������m�����?������������_���?�������N���<�i���N�KH-���~��������������W��65ŝft-eu9��t�p�����s�|�_?�Pv����V��e�F����#��{]B�ϧ�G�<B�uj���\��=E'i�u��#'��į��Ϗ�΂_I��y�.�Iy����k�"���|y~��#�ݣ�u�/ˢ��I�O����:B}��2ȿKyw�O�N�h.�������C�z�u����n��\�;��sK�]�j���}iǅ���il'~��3��4�>���J�巫�����%����y�ޯb�R9�4�^��r�q[�ԓ�Y'��֪!��w�v!�^�����F��D��I��qg����
<���Y�3�O9iߚ��1u��I.�x�)��
���K�@���E��rt�FDzis��c��b����đ������Z���s�}�
9jht����cw2�>���9ѯ���!���@ʙ<D L�q=3��E_G���R���u�H9'�{-Z
���	�n�E�%z'|���F;�q�*=�B$K�)���椱��0C��c$��@��)�Q,>���x���C_ֽ��
����>�Pg�F�\\�V7�]��@���#�=)u�5Ӑ)e��l�\�G�aX[s5���A��{����3�t&�ef90��J�я��Qh�;]�	+4�F+�I��W/��{�N����#yp��T*���X�GN�!���~� ��]n޺�T�9�lq��ϊ�.���4��̺�X�f.%�U\oa�[)	��Ph��]I@37H7w�ohO-T�!Z>py��v�N_��p5�Gd�yhC_yON}��Hs����h��5�}�L�M2uO9;�^���[鄳����-��6i�Z-��W4u��4F��g qMMP9�ot{.��X�n��o�~Ex�Wf�d>6��ţ����N�݀��?����rwsN*�dAC<>AéA|��4>��nQ={����0^Ro=r��H�Y��i1،̥t{0N	�s^��/����J�v%D^�0�&�AFb}�Ȏ� ��]��� �Ea�i?7����Y���$��d�h�	DV�[�@{��_2�֢|}�$�=�$ɖ�"�) `3�7f˔�S�C��>�r>9Aҝ\Mb��k��V^i���j�aصj�<���@���[�"d/s���
�x�$�X�:k]�����<}t�� ���ixd:h��K�j��X�L-�<�R�Ǡ.���`l_�呝�<��40b
�Bw��(a���~{Ӧ��um+�p�w��j;I��ܜ��+�jm9�i�aA����!p{���{ta[�&`�o]hFK�I7�'�H82�%H�����8�7�O�"��g6�S��!i�N��S�l`��l�"<������S�g(鉠�*�PH�\��d�m�O�@��BAC-R 1p�F^A$��QC΄o	��\Ě�M�M��R�Ę��l����T��r�V`N�g��g+�R��)�^sy���G�.��B��l�1�j�Ԫ����-0;��S�+1���f��}/t���$q�Ƹ6 ]ϰG�)%�o��T��Ѕ��Cq�T�<ᅑ�rA*QꗄW���=���808;�t¼�<�`q��7ż�0쀋�1�2���<�Gd�lfT������W��B�ܹj c�|A�Γ����*�r�ߨ���T���h�ܱ!�A7-U��u"j Q�ŵfm6�� �BG��~�ȎC�>��܂�	1K��FW.�|wo�"�6Y-�����)�h�������TJ�h�������-��3��M7� �P��d̤0��eH���?�U*=����e�?e�������W&�3����jԦ�@�2�,߿Y��w���^b��K`:D4J!�mm/\�C�ncv�����<��|h�}2m�82Q�Adew������*: ��C>��L���H�14�v�'�|U�t!�
ʕ�a�A�+i��OWg���6��t4=�3A��Fa� )��>��(���DѡLr+�7w�v��̗'OL�:��y
<�
�T.b��+�j��a�v�v���P�2�y�@`�D�t|B3�������Z������L���G�Y�2�F��c��j�����1$д% ��7;�2��yxdW��Kk%�V(�_���".Af�_���Pf�g����1��6�as�Ր���	�ԘaD��Rs
�H�{�*Z}hOp�V_�:��ÎcEւ@هV�b��� F���h&H�a'"����X���{ٚ~�l����*S��~}���馡 ^�jd��G�N~R���
JM�hT��1�M���>�M��U�K�k�@�l��<�fZZ���	pL��}��Ilse� O+[̉-Kʡ�cFh�������C�d-�_E�*�n-�s�|拽��7,5
K^VYQ�_�}Ţ��b�41�8T�����P�qW$?�'���auӁ�oS�D\���o�KJS=Tyu[#�^!����t�V��o�x�S{����{B�� (�2Okd[Pъ��Ы%��� �}��>&�������]���� �8%b��'��"�q^�q.ш$BG5�z�w�V{�ft�����#����ohwȗ�:��H*Lz0���R�t!8RD��ǧ��Hu�&�3�8\Y���`��<� �b܄J0����iZ�h
�~���:�f�-�
�D�#�@{`@�K�2�0��I��XxF�̮@/�ۮ֪�|̏��y��br�u3�2����X�1����#�f�H��� 4 �{���Kk> �W�V������E�A���HOS'h���\�X��f/�p|��\��'할}1 a�#ꦧ�t�M�N�Mc%�q<�	���Cg�Ƀ].'��7�W�}�_�m��ڞ�� ��jpR�|��ۜ�w1؊D	��y�W�T<�� 1{�Z\�.F��d$�c����9#�,wu�>rfW�}#��L���x;�Z@�����0�IXC/^n�s�$��>'�lK�d��Vm���#���K�a1Gu{w&���(�щ+�$$�9�{��1�@��C�c+il��фȩ�ܭ՞
��x���n��!E�6Y��.H���Z��Iz
�e�&c�a��'	yz�L+T��E�U7C8�?�SlPzS�Y�dH����	N�fN�K�{��"��H�X�5�4�3���M66��L�2V��x�r��-f1Z#y ��.ll�f���s���L~A��T�9���ˑ�1�����֟���LC�^�I�
j�I=�i�B��n;V�+�?��.��k�(���~ǆY�'��(Rpi~�������&��ɚ��nc���<s�7j�e�͋p�	3զ	*a�ƪ%b��@��P���װ�Ƒ���_�w��s0Dg�V���8��'�8b,>�o��˰���$ �1;F!�5(�{�����tC����Z������3�Rt[��=�O�a���*��h����f�#�������D��R@5�Y���D@�5c��uY���E8g����ޭ���{j�2�b�����7��������9�řh��������p�~�V.�}1�Z�m�s�r �o�O��^q4y �Ȝv�l3���l�\��|,���zD��+�mQױ��
�c����TХ>�*3��A����]"s����8�3,v/&vM6�V��.�R�?1�Ȱ�!��{%DP�q�?�.]�!�7��[��=]Uw��G�����K@�v)F����5$�H!~������*r���e�'�f����RX��ڛ� y�e�CPt�z�E�z��&X�+3���-�
S�w���gD�� (V�!v:�N��c��)���@ï�vG�Li�$˲�- �ֿ���ي��@V���������!~�zN��k��z�/�bWK�FP!�;W�a���$���v��K��h��"�֎�4��!�Ƒ���f �  �Ӊ�����A����]�!n53�#i<�{y���ɨ]�D#D�9ͷl:1����W �Q(/�ӘZR�Vf����O_�1V�e�ݰ���î1��z2��}�pJ������p�NC���F�C��%%3�T�Na`ע}�mB�?���I6me�m+rl�;��yh���Qp�y�Y�e��ٙ�,t)%��2�?~��w5��P��%�0��N��7��4{�յrl�D�h��> �L@��#=<� 6���.��/s"`03m���/�J�f��G��x.���F���
x�o�O�c���*�Z���3JJP)ST�3��/�3㦅��loj�a�ꝫ���װ����^�jdcJ���u��E�2�⽭l{,�6�62�������R��'�����amW9C{Y!��<�.���z��;	Tdx$.��p_S�l� m��
�j�]�޲�P��ݟrrz�V����IԉE-�/[��gO�.(�Z=ys=��� �B##^�{��Z�wvRa���i�0�5�v���үLM��K��JM���� �y|�o����珡d7:�š_$�۳.�(�hE9�d�a�[&�S�II?*2��7��plY�H�-
��mAJ�"����AQ1l�S8��ͼI����i��	������5H=����Z�=���kS[�"�)I�_���-�"�Z�i����������U      *   �  x�u�ˮ�u�ǇO�a<��۾p�����d�	�p�щ��ˋe�TbU��Հ�ב����ת��_�-�l�e.�_��?�������~�����?��o�8�V~����������sބ��U���u}����S��ǟ~.?���Q-���u�
\6����W���_�^>��>�F�hRO���4q���>����_˯���[+K�]׫ʵ��>���V��˿~k._���(G��L�!������<Ul�1h���>�������/��}��Qo�޷��?x��/9G��I4�)�޺�!U��P���֏V��
�.~�GɰJJB7$6=P��r��0�o^��O-�.��GɈ��a!�gS:��i�>2"g�Ǣ'���0��%ӏ��(���Xe��$?9���w���m%X_j�тw���~���$]%u��GO=㌫ڤ<��8�(��4�:�]���$��IQu7Bh�f�ͦNٖކ�Z%�J�QR��r�$��{S}�*��N\Hl�B�2'qP!�%�GI=J�U2����Y��u�!�ҡ�l	-������G�|�̫d��3	J�P��ե�K��*鰡�t*D�Vw����/�U�.���v�X'�6�hL�mU�H�K{�> �E���z�\Lm!�2�E*=��.�Ҍ*�pVOэ�?
�*��Ta��������r���l�t���n������������)���XicHorXnq��IX�B�}�#p.�����`j@��F�%O��N���V�����$���D(�Ʉ�<!O���G��V�k��)�l��n�����R�6xV�#�T#s���%zSl��Gk{K��0���p�D�*���8���'�t�ۑc/���Ӎ�?x
O�6D������b���Ū�6�%��^���(.��n}hJ�}Q�uKF�b��Ŷ
�k��GC�&*Dŋ(N6$v&�F��Z��TT�0�u�ۙ1��)��
Q�"�`�L�����9�~.��\ 5��K���)����x�v�JU���ڱ�'ZG�ήU����MT8��Q�>e�&�V&�B�A]B��̌��s�a��E�]
�y��h���=A���Y���i�����p/�筁��E�� 8��Чy�cE�A�_{��
Q�"Jѧ���1$i��$�Pc�um�$h���i�D���x��4�7�;�����Q��5��h?G�Lz�4l��AT��氍.%�sx�Pq�	U0���0: c�G>E7Q� *���D��K�1S���ӎq�1�l��q&�����x��mu�� *I��ʨ��A��ש����T=���x��mvb`56r��N��p�%��8����KwO�MT<�J�;0�lF��E[f��!҃����T]�xfT|��AT����e���iB��ܾ�\��r�>}eX�W�MT<�J�<1i03������s�$r2��N��Ӹ��Q�n�a�d�. &$��N�Xs��4��4n��AT����N5yYH�'V
���^�	�ۡ�s����&*D��(�k��֠�Pw�A�'n�ߊ*�u����DŃ����"�LLM*�������>����!���&*D�|۞�I��£A�sX*U�j�n��W������&*D��mO����������#t%��J�h��&*D��mO��ѪVǃ�F���f�^��㘈��O��tE�=��QXӚ�
}9ب�f ��=f͏��MT:��x۞y2�͹8��C�F�u]��z.��r��	OQ�nۓ��Y��բn�s�:-Rc�P��*��JQD��IAi��ξC	H��NKJ���L�;ͥ��o��A�m{R$UK����hH�̶F�fY�)��JQt�|c��p�ut(�5Ma+`jl+�Q�ES-O�MT:�"�m� �J9��p�}�f���^����?E7Q� ��m{����tͭ�V��mARY��m�� ��m{�C��������R	�4/�F�8�A-�H�&���߶'I��T<v�aD#�%�,��Պ9���4m�� ��m{0G��.��b�HV�&�T
\�+e>E�(:��x���lZ�uV�L?�䗕D�X?ET䵧�&��8ݶ'�5L�$��oL�>��d
~�<���@� ��=���T*7p�c륮 ����8��Cğ�מn�� ���=EU��R�b}k��e�V�Y�����n�� �/����3
rM}�L�S�� Eq���r��0N��n�� ���=�:�K�<����A҉�ςAU����˞�&��8߶��fD6_�Y��~��#w|���R�D�A����`2;��:6 Z�����"�m����
�St�Q�o�C�@T���9��5���SY�y6�}<zʛ(>��p���F(S�����������)�zȵ��(���f GI)��x�-�.В�A3��.6h�|�n�� J�m{�%��<����O�T�k��E��Y��St�QB����q���-��z܁�Ǻ�!3ŉ�'���� J��=�^M|,p�Z��i=�f� �V+�X~��&���"
��#�`�lg���@�?Ͱ=�{N����4?o�� J��=�� oR��B�C�g���ctՕϛ��t�Q�o��.����޲����L���N���o>�T6Qr��=�=r��
�����HF8�F�@�#L���l�� J�m{�k4F:�%���� ��l���(��y�D�A����p �(��G�܏�өb���yfOKv��g��&J�4޶�1�LM�ƴ͚�,2:���F��R����(M����� *����I��% �����p���D�A��m{8	!�Uf^��X`�Z��x8P�_NZ6Qr�|���3E޵��/�K�� F"R4? _����C��Qz%�2o\� �5-���+H@	������xr�l�� J��=��1�2���紞L�ޖm#��t���H�&J�4߶�1:��z��Sf���2J��R�BsQ�Mu�Q�ݶ�5aF��i�Y쏀�}�}�O[��A�&J���mC��$8�	�$M�������:lxQ�����D�AT��@L�
�����qA�r��*2�@�St�Q9^��ÂR^V�ԙ��+�,R��7�dh�n�� *���@�����Ę�MteSx38]���tz��J7Qz��=���px�z�{X�O1y4EC����u�Q�o�#A���b���rKn_!��k|���k�M�D����@�J0�-W�h�tA΅�Ԉ\ע�GP�yu���=�fTs��[4'n2
��V��/B��D�ATη�A�������'�zr<�*�����F�Ǡ�MT>���=B�L���,��|mDm0��ׅ��+��v/o��got��Ny�B��;,D�p�i�}�mP�pO�˛���;�e{D<� ���z�h蓍3� D�u�����[]`�	����X���.Ӌ&��X�	v���_җ7Q�����=�L����кRt� #cx���W�A˛���]�A�2�
�A�˙����;��=2׃�룧y�?}��;T��8����.@�&~��P*R����MT���.l�:�F*��#��8֫#E��q`�(F��G��&*�~�G=������M�cC06y�����p�����������L/��`�
f�k�zTe󄷀�nH�0?/��|^�~��w=��Ι��1�� ���      +      x�u�I�%�qEǙ��-�f@l��jh�D�!+��V 5��-E����d%�{oP���������F<q����V��ݯ>|�$?·�������������?����p�]�����L>�}�9�_��/�}#?���8b����?�[�������������O�;�����,>��9%\������M��?�������M��a����/>���+|}x{|->����O����?���_�s���g�|L��sJ�^��O����`y��|z���я�?���q~|�͑$]�ϮrU*}�9��n�]f�PL�
��M	!��ǞA�G�O*w�y�e盙�;}r��ZL�����t#�5v��[z�ʍ"�VZ4��K���(��蛣<)�u�Zc�k�>�!մ��q2Gp�[�t�X��&�M�y�Z{5!w��Vָn�7�2~V���±|�~�n�#Yӣ�+5Og(�X����Y���ʹƏ�=Z���]����_������A������}�bQf]ƅ�7�f8^o�!-�e�YF�~�f*�n⚃�� ���K.=������2��ߟ��u��6����_��e�to\���Φr6�G��r�勒��	,��;�Voo��õ'�p�.9�T����`�k�@�ń2��{:��I���59�P\�f�4Pp4��m[{S��޿ꆴ�xO9Z	�¤f��<w�sI)�r�ږ�KG+�XW�2���1R�w7��������ui$ӧ��J*tmO&��I�ʹr�����m
�8*U�r�2�N�=�=|���ʵ#�"ei���e�B�J�&1A��ژ��d�%�J���v�>���}�*�^���#�gݐ��*2i�S���?e��+:XO�F]��K�Q��b��|�����U���R\�q�%�}�iw�6,T�%$��<w�z�X,b�{�d
���\!�}��Gx�o�s��u�&�F�8��$�ٸC-#�g�휽i��w"���)�D�(�ٷ.G���@q�X6��d�m����v�$�-�,{,��֩-b��\<Eb.Î6��u�8�]PUϻ̌#E�n�5;�.�D*$���\��0Z՟jzh����Ϸ���w��1<�K5`7�[̋�%G����ٍ�3���e���n�i�RKN��~���G|��;y�~���$�&�:�޵K\"��x�*�L/C1�B�ϥ6�)����Gz�U<��h�a^���Ն.��.!͇`[1��ԙ��m��j��i��N?)=q	WF��@D���+�H��B&n:�:��h��}�6�ʕ�U��e��z��?�Kmx������]'��B�����̮V����5e��n���T�����6�u���T�K��a�:���\��d'&�Ks���4U��v8y-;�r��{S�:�3]x��wG�KQ���VO*�|�X&k#���t��5�t��UM����y��Δ\w��#�d����{S�ַi�q#��zK=����;���-1��6z�b��Ř�~�ӿ�.�Q
��;�ůc�=��5;L7��-*m�3~�rt���+R�T\��ף|�w������&EI����#g�i-c�	Gշ��kG�(t��p���2e���Gy�ӱ.2����񻻛��v�@q�@�r�����t���A�����.0�3d���jh���)H���1�u��c�k���P�!􄋶�9�����L��c��H�L=��,׮:�s��1K)�<u�r7J\#9#t�c�&�U�f(m���mR]`(�M<%�6�D��(�G]i*���^	e�!~cG�ޔZ_�Bk�F(�?���cb��m��g�֟8���A�(��<��0����C�����׺�V�`�֧���m��m��i!�4sK��3q5ܩ�ϩ�+�ᲴH��lwEnNm/�!���S˅��5Ѻ4�VHc�1E��nsh�C#�[�&�����f��ZD����+i��r�[:4+��Pq�Yս��c#?u2�d��ͩ�>@�4Y� �}G�)7�O��@	v��Y��3=��r#GK҉��.q��7�j@y��K�w��k��!0���nd��UL]Ԧ�0zK"�a%x���ŪJ�O�aG0�_4%�LM�:S���T�'ɯ����?$�쩽�)�Z�mJrc���+��@A����%�|���� v(l����$J(*�2�A���w���Ue�-�4�P)ތ$UЩ�����LBb\�҂�U�~Sƍ_x��M��d��U�u��c�QtX��m{�Z�#`.Ɗ�T$SЌJX�1M��R�75��Pyn�����>yX��Vs�(VYh�.�Dсsf���Q��S�t:��m"���j��Zb� ��ͫ�w�חӗ_��8� ���L)����.-1A(;�b̛W��^Ď�C.�N��EW��B+$B>-S��{��f����S�.�k<�����+���
�	�4ec.I��`�Ju��)�SVk�3�} �
q5	���v�Ԫj�xze-��R`���6Lu��E�hQ�I��k��e�i�B�rr)�t���S� �
����n��P�.����d�I�@o�J�(D��:�,nb��|f1h�t���L��I�Fp�: Q�,�GJ���I�Jd,P׽_��C���g̰2V�M~Q��?F�;�]��q��He�O��8��1ٴx!���{�M���bH.�T�&k�J��
�<��F���0L�7j��I��j����ت���4b=�_���{�aa��ao3y�@8!9�)��jLL��5٣P�`��M�z��-jj�f���������]p���Y��N����󖲡k�h�~��KO.^a�e�2��-(�����3]hO�.�ơ N3Ѩ��Htu�l�n�Gn�:^�k�Il��T� -5���ZG�0�NPO��mHt�KĞ��j����T�����#R-N�(�v�z��U���v;�Þ��D�-!'�Ȅ��L�j�y�=7���D!TX
��� S���������f^RGGv�����F˥O $C�7���*aP��@���"�ݒ�4C~��K��(�M��/e��T��M���G{��cM�3c���ob$�"�䝤O���J/����,�7!J4x�;���ۼT�R�D}���C4+=�L�nfHR��Z�2�Ͷ����t�������c���t
��+���(�m �(p�����CF�b�3��
�i�!�'ۡ���p-�8�1����:����V=�nD�s��eᕄi�XLw�o�yl9D�>���P��m���nƪ;[�L���L��y��,5�@@�L*����JဴX�Z����_ب[^���L%'������:��4 A�VP���_�,���vs������3� CQ@:i9Ÿ����͚g�N�/m��^.�Jz��`P������Z!���6<��(ۨ�-��� :E�6}�7`N`�\�iß�mϒ�F'�%,���)��b!���8���f�l�J���Ⱥ?0�&g���^pD��J���U�(렜�sR�W�~�jdc0Փy��<Wu)�`�#<�Z]{�m��x�|����3$���&g>	��ↁi�k�z���51D6�G	�k{�4Ш6�53 <K@��ޔ�^��I=�z�
��&Q�x&��"��t���Xo_r�/P4G*'>E��Q�'��1��O;|��*�tS
1���s2&�$�X(�K�h���M�G�:HNTffsL����}����=�C�!�H���YJ�fW���@y�PP�FM�{��8�b�^�,�,����"?��`�(�{
���q3�wO9��9,Y�������ǟ�*�4[*n�:H�5(*'�n���<E?�m_{�7�z�z+aN}mi���W7JE�]?���^��6޳�J��I��M�޽N�I'��v�����xD��ƒS?�"�@���#2�g�
T9�D&/���3���HH�^`N�S��t�*kwcGY�=�%�q�«Q�����ͯ޿P�A�,��!�%${m��;Ȥ�}֝�0��(J5�c�ܼ�Z�r�+c��4pF!}/0"}K� �  ����0&�!�a'|�;e[�9����y]���^f�s��`��Q��^%��#�����T����N�t���e�����҆�}B���Xr�+� ���r�r0٠�D<rq�-�^�1\����M��L�2�+��`u��K����$1#B���5P�!�R+��}v]��k�!������:m�?��^p�P�"�:$!���39h��ѱA�%�E��N���4H�	P|W��7��HO�1��6{D���\�"��q����M8+�y[O�,�����&�����}��uҀd��-Z=�m�����}�-,a��l�\ľ��"��x�K��{��������K��	&�\�ĭ{jt_O����P���kh�Ӥ��y�Cb��Ʊ�M�>=SݙK�+�y&ȳ��{�vy�������9�	��2�=!N�<G{|Y��WI6�q��,/�[�������]��H]�t�Ԍ� IK�S�u�O+B,�i ��w��-	�R���	1�>��Q�.',��R#��F0GS��[�[�H�`}z�pDs 6&kج��y�
���1��@_�ì�C� y{3��.���/�_'�sD[�b��/[��V��&=��a��'�;��E��(Z�V�=���yS��O8�7Pg2��M�c��T��Zb?�j1g��#y'M������}x�ͯ:[ϱr��!k�J�`�଀eHK���ﮞm�4�k����:x%�m�{|a �zj���>Jʭ��mfӎ����j�/�ԩ��ӆ �E��� X����7����n�gS�IPC��o4��r�\��nԊU�S����X=���7�r��'�)�&�����=*�Y����s�j�;Kғo�;&�C�P���� ��,i0�$����bM�5V�x���7�R㙼���|XS4��Jة�!�v��|�����#ܵ�@���1��F�Y���Ͷ�n��n/c�M�(U��R���n-�u�����B�Nw��J ��E�\ �4���H��3��ϟ�W��b\��p�gy�k}�4�:��Tވ�N�[��uW�l�J��9:�	�D ]�� �`�@6(߃b�K����ƮR=^K��ػ
`O��N�)��乪��e�� b�&r���+�A��ى�H�� �ѤR	}#5�ɇ���
<8�q�E����I�%b�Ǔc<ص�J$�֘����M��$
�� ��ssv�D�g��M�	�s.��+.2�Ͱ�>?Ө����;u�_�_�%��N����/���_��[      .   }
  x�]�K�]�E��(<�
�_d3�	 H��"��Ϫ�{�S1 �	~uN��\�<3|��}��ۯ?��ۏo��m}����������~��������_Ɨ���a�g����߾~{��_��s ��o�|1�����_��� �c�棓\�ek�������k1Z��z������z���U̅�8��:+�9i�k]{����㎭K�}7c.�T�)��0�c������_�����c}�k�QFp�Vq�iu]Gw~�R�n�W{ͿG�� ̵��s�<w�5:�vo>��?��W�AjI>s�������x��kK��˕���R��2�v�'j�;Y��(�c��/ϳ��(S�El�m��嘽Ӛ�Ks�>�T-�<*�(ӊmFRj��ƞ�%j�Z��4m��<��(e�l~�SA��8�{��t�]�r�K��l����;)�}9��H���i��p�3���M�G?�_���l��%�e�S���:��R�L���@�}�n�Xf@=y��L�H-��Q�,��М隮V���O��:���h��V!����hqZ�ޯ�z�J�3��L
b< �N�����P�}���<Ԯb��7���a�W}Ub�Z�s��_m��=�#A�
��>���T����Sp�*�����A}+Zm�Z�]�3R�K���uj��I�i�U]���%��_ �H%�d٦���D�n׹7�rK]�i#)��n�۵�Җʼ��(*��1�v)PN����Hn5�Lr�W������x��v1n��H�(�~�:4}+w�/�1�t^b�Hh:f7jcˬ��ܛF�-�8ԥ����!fuk���k������W-�yp{%IZ���)޷)=ɥ�����+�Ѐ}��T���an����1�]��FF}+,�4��i8؍�y�Y���D�R�����p���R�t\�f[��JQz)�:��o۹mL%�_k]t���gzI�li�Y(}�&����j@3�u�)�����%�Noj��W(�+���pmvͥ�&3%|�uMP>k��h1��u^����,�I�X3E��J� ?8=
l~��:� ��x�����4��gE����Ts�j�^D��bm���<�&�C2�xw��dݥyi2I���U�vD\�%mf,O�U�u�I�������~�H���P��?��b�b��(��&�fg��c.��r�eO��� %4q�2b���B~	3��N��|ԑ��3��
��l�/"Yb���B����x���>{��*?�Tۄ��� ?���]�:�,�/1��hb��,G*��zɮ����X�H#���{.X9vl�;��k	j�6��>�4a3ß��6��\Ü��p�3?�F�%
�.!�fq��u�K�Xx�e��Hyf�S3�Fz�&A$-Ȁ�{�KG�M�cLd��f?N0;�-�� �:�8\�V�DҰDT��PӞ6V�\B⤨=L��_D�a��!�㯂272lMER�m�Syɲ��-�
V"m���-PF����M��wFo���2��hi
{���~���$�ޖ������&H��5͗���#%�!��������C���.n������+BNs%�]��\rT׾��&�^�d�әm$k76��h��3�z��I$���px�SS�ԥ&�$0�>��.��|��MG��b"m�̀N�D�N�n\_D�KFO��i7X�T�;U�+��&��H������s�"PL"�����V{^�>���3�VC� Nh��G�g�.�A��[����� CGK.E�L�}g����ǔ�k����^"��?1C��:����&R�\2�j����n��!K;u]�V�D�4U�A�Gj���`r��>;t��[Dj�T"���?:� UV/���p���拘o����i���aC�v�o"�DLe)G�G�Í� ��G��,�_�	�����A�P�í������?�wb?ä�3��YčL(6e���"R{)�mK�6�-��X;�'=��7�B�Od9���عh���D�j�.�d��3G?8<5Kgw�dM?rZ�~{I�+uc�a6���2C$��w�ׄj/"Uf��� ݐg�4�S[]��-_�"��pw��,T�,��Ѽ6���Hﭭ�7>#yr��c�33v9�����}�L����G�Le�8.�����<��Gb�S
d(�)r	�����}.��6:����	�Isa
�cK-�G�'���!Gs�.gRT8�y/�i݂��z=c�i��A~��E�&�x����H�"Rxݖ��c�3��Y�ĭa���]�USy��[v͙:���^)x�4[�h�����$�Ɏ�?��n�D Ō�i�ںo� ����ͤ'y���4�+k�t������p!i{�����h��+fJ�/S'o"aK�B��LY��/��`�����$R�����#@�~�^�p�Kqھ�+�����I�%��ŭX�gxd0\zM}om�|l�g�]ϧ;��j f[���7��N�U�Or����1�a��£��+��$RfdǏ&��ǁ 0�i���Ob���P���]�Na�P9Sf�_ۈ��鼸�/"��Q;��[L�u�X�����M�D�x��Rq!��^�(��*����zp�k�⋅5�e�U��6�����a�d���"U��G�.�H���Mr��q���|?�?J����|������      0      x�=�I%9�d��wa��*y��prq�U=��](T ����Ai�)�?���|����O���_����Ӿ���~���׹֌1�pg�Z�0W*᭶��Ο��?�\�c��_�c�0�la��{���������ǼZ�3��O~�C_y�T���,��������q��FZ9��SX'>��,oq��ߝ�?3[~�c��n�e��V�ɖ��T����y�Nk�3��ǳk�ݕV9+�������
�^�5[�<d��ܶ�y��5J-߾��!�y��W�6OO֟���ycl�(����� ���g,j_�K�bX�Y�q[�S�5��ɋ�2��S_>���_��ʲd)�q��Ri�6g������s{o��~�������E;���&��p�j��~9n��^�rB�Y��sO�[o�g�ww���="ky�te��6�6��|֪���ޱO��CϬ�ȃ)k\�gZ'u :��4B�Ø�f��z쓃��Z�d��u �K�쥭9�h�ϗR���f��55�|����V�'�L�� ��s{�|�P���@	���~'�<�7
Yՠ}O�h��3��s<#u ������Y���AÙ�%�4��tf���=S�$H��(j�_)c�����X<;|����l����9���S��'%]yZ������x8����ȏ��5���m�a��)&�,Z�����N��3�����8����>.����Q��|N�t?%��Y|�m��v�?t�b����V6����tн��������s���b ���VR*���4q�S4xKm�J44c/ʈ�o��\oZr�^���o���{�s/��ۙK���P��V��/������ �K@I�-.�/\E�[k�����G��[+�64f�;����U�
K@�|8���,P@I~����
�ɹw���ُ�2�x���ȱ�x�>^�\%�[�bQm�,��~,y���37-z߆�6�a19�6w���Ф3N�E��g~(i�	��z_5�=��
�!u	Y��By��L�P�۬Xz�t��Ї'čR�Z\4���L�CaT>_���B5�Hi���5�S����
t^r�ni����Zm��pޠ��*vr)XJ�i��<o5�����%�j���D�r�x�(u)f�a�x~۴;�Z�7�C.~�'��Zt�7td����8�Gwqʵ�E!h��T��0����dZ���]�ӨI��|4Ϡm��a�����׫ň�r���,^�$�TYK�F�.�K	#q��w�C*�Ŗlz�rA���ꐜ��l!;���x�/I�Հ�A�M�yn�'��[d_�$�G ��;�8�.o�����_��T,	;�=�s��v
m���6xᡸi[v���^�'�Y��)�62(���"��h ^~b�Sk�M`p�5_b˭|rc�Zԏ�[~���4Kq�Cn�|�f�K���5�Uc$H}�$m�V���������X�A���ލ4����'@uP+8�:�q6��O:`��H�`��A<\P�w��Ͳ)T �	��߹�g�)5��G�$)kOZ���	J�$ܷr�����
�P�0p7�1(�ig�E�������	a-��.�Y��J�4���g��d�2hi���������I���iA��}��oIv�hX��'P.I�/$w��C [�4�W6W;��a|<�6�-x@��iӰ�j[���X�i ��g��F=�O�r����5�s���:��X|�ql�.��7�3+�i���)����9�8�MP�<ae��`������P[z}!��� �fn�a4Ҍ݋4+Ɣ�Bdv�(�N���נf��_�lo��P���#*�n��[�猜Q��P���h��X���൯׉�"��S�b`^1��v@� 4�����D*G�P�aU��ąZ�P?��A�q��*j�2m������w}O��.��<r�S�G���p��Q��ft�Bػ�l���p��Fzy2������<�@C��l��*:�����s�R�{�T�E惏\���O@��ȿ���S���	V�`ˀE�B�C�d�7(@z2�~+�E���"����KI ���#z�l;R1;݀�o� ���	�K
�Sʐ��!��p��۟�al Ą�J2�4�0�)���4�i80<6\E|��Q�9t��a6T�i�F{�Q��
��Ʌ��͸|l'�,�p3֯���=���՞���zWzB�8v�7���Nt��ĺ�ù!o�N������_�ۜ �k�p�$���I-���
~�d������1ɜm� ���BeQq�`���7�|2��%�*X�:}���ER��t�҈ͻzE7 ��pȋ�)�g��ǈ�~�����Iu=}dNG�S�i|[P���#����?��	q�/,lU(�<}f1�<�A`���z�B7!��%�e����k":R���;��p�Ǐh�7ɰ�:f%�V�WI���d]<������D_(�b����Y���ʚNI�9d�aC5�����۲��������!2��/�4M�%����??pa��+�-��>��w'J\y���e�	Ñd{�C��gJ	跅�o���7~�{��p��c*�`�v�S�jc��-_K�69~��C�]\��h�JO�w���6���L���Sv~E	РRG2�����vEω����=��$T�s���[�����[��l�CY��H�!�N��bh>�I	$��x�T��d�$��w���l�޻�y"q����P����5f��u����j�˞��d�r��n��
�� wc�Lu	���16l�~�����C�!\�_�����c��4E ��ғ2�0�QǱ�6�֨J*F�L�a��.|�$����aF�Kοlѣ��z*jvaH���Ftz�#!t4�m��m�Zָ�m�\��v�����V��m0�77�Rk!�x�j�e��1/���Y���{��HNs��m~�e��T".�H�4I>욂Ի�3D���P�$�B�����6}����CY��D~��Ǡ���bʚl]d��ӔN�b��/�ן��x���L	|�毠GH��$֟�Q�.v#@�=kĔ*e���@����ʳ�FC1�g��]G-kT�Ѭw4z��3O���
�)
�<K%�|���A� BA����'aT
^��i25ԠR�phN�C
������8���hV��5�-xK{� �'BO�C� ��%�0M��9�O�4���hP�ǬD�Ũ�G�	���E�m���x�G(.�u�W-ƔѰ3����%-B����(� 4�n��~�*QC��!�D&�q<�Ӯ�OӬ��6+VM�$!��;Y��V'N�<[�򏞄��~��~���i�~h<sS" ֳ4��Q�{�<� Z���B�%?A��m�7�;��K �j��)�3t�hc���ϲ���E>���ݝw^�b�|�W�-PR�dX�y������1if�(j5�Ihplv���b��eq�HI�4MA'�L�!����}^��f���9>T$��l^\��P��[pnY��*2@�@��I��L�),�	Tt�^�X�I�����; ܅3$>�8`�h���ܺ,�r:�<�D��\���fZ/b�y[��S���[�A�z��i�������͆����fq�TlG)��`��9F��.it'��I�>�O_<�f�]:N/��r8���Q��8t|"-x��w��x�^�!����n��2�>Tocq`X`I���wI�� 4UM����D���}��Gz��K�;i�����s�དྷu%)��Ba/�7���޻�)��D��3��Ì�W.��5TM�2�yh+&)���5��)�5M|.@D��6t��F.�ܶ'�J��oP�Hn&�tW9��uK4�������X'+~�l��~ic4�F%�k���IW��
 4�a��"42d�rF5�~����:QA7%�y�U�vcB�{)�4(�ÊC]�i �.�Q_7X��cf�USF�$�Ѭ8\j�_��.}�� .�Ǖ�CpP+"�r��%N:k�^��p�q�"7��m�_]�� �  '�	��(��{k����1��[�jT�����H�=�R�.�8��M�]J�M���Gp�8��u��^�G��0c�F�4�wY���/�zɣ�w�hl^����ʽm�M��P�Ӽ��/���k�}����i8���9Aw>����8�8 7�������Eބ8DGKv�7�9����(�&�W�9��銥��p�gqd��S�e�89412�p0��9妡�nKh|z'�q��$�	�G7��2��B�I����^":惦��ė���tޙN%L����<'ю��vΈN��ă7R�)X�\3�Iٞhv`#A)?ߊ��|�᳨9��l����G!6����^��r�t���Pbh�~Z3��[�E>|������Y�@��pՂǁ3��h�`϶@�Z�)a�/j�2d����~�Nv�py4�����o�� _N�L]��#��5n$�ʟfP���C���?8*g�P��Y��-�3lD$U"E���a�{�x7M�L��AB�G��]t1�hiF��;o$~�j҅����]�{<+�D]��������C� #��F��s(�i0=Pߚ����'�w���
@�g���N�i�r�~�U�50Q`	��-ֲa���W�4�ו���s�7E�#�E����u����A��p��"b��@G �&1�zfΰ�l'�
�A�.�&�A�d�g���	�Kț�Vae]#Tר�.�M�D�^Vz��(��\�y.R<�n�*��t�>ϊ�#YՌSѧ@�qMj���wiD]�T+^@���룀�c�V����(O�����4`�����~�����tdtl'���!�<ڶ"7�N�������}��,��Ӝ��ٚtSR�t�u�n�1e_zU/"<YΖ���.��u���àbi]��8� �6R�ov@ci��84,�n��'uD��4c�2i�#I�:�.�ߗ�n���y��}dp,;��K=v�Vۢު���34���MCv��є�5��&�-D�a�f+�t4]�!x�$��p4Gx��ݵ^L��zܺ�(��Θ�VM�a=���!WM�����<���%˹B�cѧ��U#��۔���2�8v�Y������&����+յ>�=��p¨�)�o���p�/�ա�����$����77h#Ԃ �9$�@V�֡Y��τ��S/##�E;ԕv�<!k����� ��<6��[��j��E�A	+ȑb�f+�wh.�&���)�a]�ew�Bʘ��i:�S��h�:�b���zI��V� ;6�Ss�M8��f}�ƠGK���',	>"�s%���YriJ���T㻼��4e|ҹ� J,�X<���$F����ťh�Q���������X"��GF +�Y"`���瘶��������\#1īlzx��~6]�˜Ұ/4L�J�=�i]��!U�>�H�OA-p��J���+9�TP�#D�!���8��a�H"������{�@7�ز7�hݚ	42�P�T�p�!.jH���1��!�?�@�#�4a��*�p�o���/��>����X�~wOt_D��ZW�U�Yu�+�f�5��E�:^�ᲾT�;R��"F{zz�����A.W����=um/����Fk�H�����[�<~���t*T������J��>�K�"��-
V�<�k��ҷCdb�� 	�SD	}��!}�Xk
1���=z"����B=(y��� aX-�mK��Âc�e}����\�M7&�?�9M��>��k���"�3�c/]�� g�f������j������ �m8{�x���U<SR�	0�
�DțEbR4]�']���v��5��	H��+��s�GߒUz?#��V�Ü�6]-jl�(kH<2V����4�2��rǛ>8�i*
�x���(��A�^QR���}��c��ϵ�+Q�;y��P+K]��4�#3�'��z����F�+�<䘿Y����#�a���E�;��d�s��84}F���t4��i�U�����F��Ј��!d�޲S���=>2YeSV_�!u7ɓѴ�,[��t�V���� �^��8�+6��	Bˮa��8�:�Z��㣶�����ҮF��Ui0��E[ɺ�mB��3�`{�����t�Q_��,g@�-�`�x��SKs�^uO	�B��&1_�k0�"�B��q=��q?\6��;��M�C�I����S��Q�L3l�k�G3�1(����i��*�X������o�ଢ�X;��i��>�Ч_SSf�����D������ϟ����"      /      x���In,I���槈�C��B�� �ѱ�@U����1*i��t2_����&*�����]��hl2��������������w�y�����0�3�0��q��]˽����������e�?>���k�ן���?�V���x���Ä����p���3~�V�
�^+�x<^��a����{�V|��>^��Ӻ�N���e�ȥ��_��k�a�0!�f����2��9ڵ�L�T�[26_�p��?޽k�9���������s�����}�}[��1.Dkb�T;��3���_m��ޗ�L����Wl��B(����������������TxV�����<�]k�'̳N�x���W��?{�[��������/��fO5g�͛�iƙΌ�O�k��������_�o���%A|�)W�M��o�ՙ�7Ǧ�[m���ܠ����,Η�?7��+�r,/-3W�&��Mk<��{��J}^�̕����D��bM��;b�-N�-}w%��m1���7�l�l��C,�g��?�J_���l�I����y���;}r�N�u�0� X՟^F2>�Ȓ�2��m\_Ֆ�����3��S7n�F�i�S��-o�&�W�'?��D2��:�d�r�)���Ϻ�ʖ}v�m]b��5Ƴ�2�S�q���gܞ#�Uc���{�'����윂٧4��~۫j�l3�g�< ����k�f���W�˓&�I�|�&���<�t���={�,����͗�G�.�F��0ڣ��5=��*5Og(ש#��!p<\�Ǵњ���.����
3Q$+��7�lF���E��S���w�;k�o� �Fb�u%or<�:~������s_ɾ��}$y_�����D�mk�c'/OJԱH�c���[����ƒj�l�d�>ۺ+�<(���(6���x�qzv����c��������0���qO�~21o1��$���0H�	�����{�0z��{�`/LY|=f���\�c��)}l$CV㛆Qu7�6�%�@��VZp��B%D��/�[�-��v|&�%����!S���L-�e�[\��1��P�p��I�3�j};�7ˉ�״N����c��Ӹxkv�]�q��⇩�r��Q6{�eӫ��Gl���#�vBĔɨ¾;��=�?�ᚒ%�w�����i��=��J��d}M��ϵ;�����{ �O��<��7���~�����Ð
���[����5�T_����=)��|��$Q�Ϲ��s���|Ӥ�
��S��#�)6`קU��bz��$޷ �T��+D*��\ww���]�e�Zʸlؾ,�E�
'���Z>m��w>�Z'ୱz��}���_���������*9>�<�]�0�������l ^�#�v\@�-�v��;Փ0T1QK|֧�R�ŒP<�*�WS��B;:&�⫧cs�֐��9ڢ߁ϻwix~�3H&��Wx"y�ۏP@ ��������y������bl��0�_P��zn����ы#S%������%ۙ/g;L���~��J�M,'�����?GS�o�Wpo������䮍�D��&��	�4����[e�k��B�,)����a29�fy�~��q�(����x�����vI�ӂ��<�w'pH�k6���<��)NP�}AB0Pf95|&��ӷ]��v��A|O��zm�Z�h��NPF-�+�Σ!�ح���g�d�c�$�:e��1B$��WAT���7B4�GU>���͞���$9�PƲ�,��p}�f�ݶ��ٍ���D��>��f�t�T��}��O�H��e����29�~��O���kX�0"��C���YE��؄~r�ɕE�N�ט�$��4p�,*�f�n��8��M��"EK|
� ~�(o�6?ڪ���/8�V��i�
r�:�5��Hs�1 _�V��VM�qo�>����)�1��v�W�|x�|�P�hb^�!�B�0`$@WKrb�8�3��F�7�4U�q;f�#a�;҃�� �:�?j�.��gDB����z4c �si>���Ѻe����Nr�j>���i���Tg%�N�kÖ�g���2�rۢ���{9W:ػ<Ze1�H�����͢J�'���a��Yʒ 򀽈�ў	%Gu���3�Y87�7��>5y�Vh�3��D�)Fn/�0_�ع�r��ӤZ���0#��곣�,o,�C\���L^� ����Xێ^u�M�(N qD
$D�QA���Y�6�[��e<�|@_'P�Ѣ� E_<�
���x
 �p�~o%�r C��+�If���#C��Ca�&#�&��S��+f2�\��r��؊$:)<*�1?���3�i�[| �` 3#���nlB!?W�xf��^a/kq߈�.ᾶ�/&�=s5�O�s%�%� V8)ŝ'&B��U��b��eA��}v�IN!|���	�ʗ��o`��H��|��aP��Ħ�#����c'Y��G%
�kY�4d��2K��ݹz�����I��&�c=X��Z~A^eH��Қr<�(��kPg W�~�V�ö/Զ7����Ir�d�䁬�Wy	~d'�R���G7iP�4��:��s�z2
�B�*p�V|�ɯ���ӂ�6<	:ە��X ��)5�*�t���`e�*���,ϮP|���u��%`{��v`]�r)"b�JBr�r#��u�B�WB��E	�2A���$ :ʶ"$�+gϸk6�:A���Am/bƧ��,a�5?�s���J�GJ"	�p�r���e�W7vHI"ƾ{"a��l�y�I,���J��5��]!�j��+S~�`8П���xu�0[��z
�g����j2o9f��G���:L.��-��b��ѣ�ʘ,s<*�\�Yy�^<I�����'\sN�� wiD�a���$v�دf!$@����]g�oy;pGe��,Uk�@Ar�t��'ɧ#�7�i5a�DiR2a������`!�NM�wH��ƶA�&�������Pm�u�5���Y�O8����݈�]�U66�/3��8��s �⻈Ȟ��J�`]��NY؂D��� .��u�J�A��,�b�~쾭YںȔ��������M1�����
5��<rȂ�8��6�V��^$�r%ܨ�|����y�0�&Ǹ�,(d2��F����8�UmR��ޅj"���\[^9c�0s��\�RMp�D���Y�	�Z!�㶘C����;t�ّk�Z2���M��~����Y���H��
��8I�	m�9�;�2�!{��$NT:fR��E�upN�����˙P��-�`����+/��dc
/�+a��L��.����9���-�6�@��(5�������cBO�����n!~A��xQ�((L��#��U�	�Nɧ�+�mM	��{����ɿ:��3�e9�� X�\ �BN���WO�X�GXzj���j��k��K\�E63d�"p_D͜!���pڀ� �(y(;X�Үd��4EN|�NbXV}e�h�2Ӹ���H�D2�kꢊ?���w��� ��{��e��{@phc�İKi
aB��>_m����9�����r�  *e
~n�4�M�n�˅=_�<"8Z������`чHz���;����Q�Hr�-�>�؛�����@J�����닂)s�E�I�X�I���C���>7�>��v���WB��ʸ)�:�-���p�ML�I>B	H:"׻4)�<>:�Y!�����k3����Ue�.n�:=���#ﯓ�qJ���dj@�n��2۰���@��H�N<��:�vA=)�66���XR52D�p��	��O��6+�Q*+E���?9<�x �]��Y����FFB	���ĭX��;ץF�
 F߶\8��Zg�i�v-�XLk�6!�^�n�K��Ltb�m=,��.����h}VE�,��G���֓u�95%k@mx4��u�d�V����ՙ/�Jk����p��\�]���-�h�`�B�P.����_톉Φ4�&���\Dj+��/%=m��T��W�#�Pi�SPX7G��b<�Y9�+�	�89J��&�jC�A�P��<���    �# ���nI7e�� -�_�WP/:�$���@�
�"pp6lU>�Y�x뼮�����j6�*t2SRQgQ
V�M�N�*(\�5���ݛ�@�"����\�$�aF���P�4�!.�vr�>��s!��z���:�\BH��j6���}c�j|6�d��9~C�	�ʱ�c�q�uA��&�<�
Dw6��%� #t��W!���,|BeC�!բl@x_�Ź1S�8��m��>���TBP����T��U$y2 �T�f�Nv�����ᓲ'��:Nѱ�����Vf�@A�~�t���?~���5���?�Ŧ���OP/�����>�uXE��Z�ο�����$r��=�����R"��%�;� H?m�Γ��&��@ɒ�CLg�Y��m��[F�u���$�|��O���#������}*�Ԏ
�W}�(�����$����N�z�������w�ZQ�v�#��˗�URokRܵ����UZiۦ��>�M�xT�N"���|���ɉtС�=����9t�*��$y�OT����Dp�/HU@��dHt5|��Cu�u'�ܕq��#�
h�o�R޸���s�u��<��L3�v]a�3�}eˢ�?�����Lza��E�=O����>����m|�N"�~N]VJ�fu��	��}��!�A^���-{��``|܀
�P֎�	�߽,�Q?� [Ȃ���*�+��Ne�T�� _<׭~P�r����߭�*�gIښt�tܣ�������[�YlyT '�ELx��̀����H�^`pS���sj3k�5��Ǳ,ޞW�Ѡ:~�KY,��w\��������n6�>N�H�0��@��0Pf��NC�}�|;5y\ĳ��Y7)�?����Qdٸ��J[�T;Z@�e_���(�U6�4�R�xŹ����o����s`��X +E#���:�'ε�E�Q�^߉�0�Uf�J�sQեՎ2�ˢ2N]���TA�y\�q����n�r�Dݖ�M�o52k|�C{Q$�w�=������`7uP�o�11 ��O��4�n���/	��)#����F]�6�ɳW����/����b��xY�D��+�:�E�PS+��50���u~�w5�c��uf���wu&�Y8����@�uL^�h^���.�þ�C����2GsxP�N\�^��	���v++G
I�-=�d��	�$��kz*�����>9�JA���|�F�@@���Qq��E�Jꓟ1uMՠ�H;�kx鸧W�?Nyf���Vw�!lq(GM�֤~uP��`�߅�ε}�+aʻjn�<W�^a��5Ylv�M�ĕ��0�BGϼոH(��ؐ&"U�K�z��	$���G���W����Vs/�N�������*RW���ٟ��G���N�ޡ��>�|N�+�,Y��u@Sj�R�exe�b��
[���Z����G�AL��~�lqھG�f)��۞>�+%x��直Ñ/� �:r/<��NS���]�����tn�bgY^��5�����X$Ԉ���|R�p��{X��=2��;Ҁث~-Bg
�	 X�Lj	Dk��_iẳz�n��4Y�I������,R+��1�l�c�1��:���O�����N�65���^3p0���[�D<�����0gM�¦��): ��^�j<�����iH��D�	e�9��)�*�������w�d�	7���\��ԬFj�]���6�"�P�-ͨnz�^>����R���(k����Af��Z�-���);��ϱ�g#^֡©�3��VV����Z}L��8+�N�����{� O�mH�::�N�U�X��04���gD��S6ط��Z��ƹ!�٠r;��r�5<z[�'Y�{�1CI�.Oɾ��[�n�D,P���|�u���/	-�Co�	< ��|�+�^�agN�h��(gW3G�cN�k!�� ��,w�4Є���%|g��r����၍��Bu�u�h����� ��#W�� �`���#}�b*�F��Z��@�dn�n�O��H=|��ђ���B@�+��A�	�W$_E�}��:5c��' �_e���[��Ց(���1%+�r�\����O<��AAT����&�jAW�j����؂ ��:��UmK:�E�_�W5!ַ�	��=zMm�i(}��0�I�[��/Q+��X��������Nw�V��hӳ���H�j�&J����K+,:�ͱ�5��-��ѱ�����9���ޟv��o5����Pk��IRŻ����L ���1�؂·���'�^q���Y���mҬQį�2���n��B���CF8��4���"Rd����-��]q�]=5I۠1EL0��c���D{IH��H%�>���kD�����{���Z)-������"[XR�����H	1gͳ��/��U�/`�VK�83`�c��L�D��jTR�Xq���	�@d�ɫ��s�ia�~��c���gtOJZw�΢�R~%����m��w+�5m�{;������5�n>���ㅨ�f�kYJ�Y�5[7�h�jMH,��G��X_�hw��lܾ�8n�T1v�=�G�6��#~����YB�}�F�ӌfԏٺ\wQ\}ivodM ���?��8Je2��,Њ���3�f�ܚ���ס8����`��` آ��!-,�}X�&$w:�x;lgs�N;K勒�M�TQ��[b�U�M��u��v��]<@US�����*�j:c����d򒦎<�Y �,ۑ�ꆥɣĞj3i�
Ux��J<��n���͓���@�|�����;���7�5��4ȧ���L
�������==��x����<���AE?O��@. 9�eF%i<3bC2�l\�i�_���WJ����m��.3�ndu�z������.�Z�K6ʃN����yL�O��GYF١Y�#���Y��o���.�j*G`X���HQ�v��Y��?x�Ȏ�$�'Y�fHW�����Y���!Q`����됧(5�Eʔ=N�ux�l��!q8���X<:�FLuS�Ci�*�8�J�V��.#��Z�i.ؿ�ǀ��VR��]����l2o���GY�zU�f����O���������Y�k�i8L5)�#7�ZP`�&_pV'�T���3M�
X@�C%��L5�A������@����`t
C�M:����0�Z��q������4�7A����9�h��"M]��HfL���-�$�C]����w2�j���1[{ϭx����z4Wzy�6	w�y���Dp󿳮5�k���:���s3�ё��Z�{�t���K�]Ѕ�NG��Ξ�6�M�c:������iC)��Ο��N�c�h�Y(�Gs�>��z]j(6��L�b����Dv��t���)����z��y�[<l`���x�nMP<I���@�;;_|bUjVs�ҵ`�8��a7d:���r�oߙ��t�"������Ĺ�V`|1����)vN����:�Ϲ1�N@Z�B��]�W�c�N֬�,�P��T��k$b�A:���kT��{�q�y4)��<�{V�}ʕ #쐆�AЊ�ŚA�,��4��/[�f4�����J���t�7=JƪΧ Q��h�U"�Aϗn� G���nĩ�Qya\{�>�B���D���1�HE"����ֆ��F�s�
��su�cxք{����G6�-2�`����v���V�9��Ā��4vF�1��y��Ⲝ�� �:q�k���b���6��G'q�������sT��'�uJ�fѼ#�m��jU������0�Q\�<G�A�f3^�Zch�o��͂�Ԥrq��_���v ����xq�N�cTo���9�u�Æ�+��>�ި��;1H�x��� �M�X�%�o����>\Ԑ�Q�5��c�>���Y�[�ݍb"bSr�l֦qՂ׿�O�V��{���Eg�P���wMs+���	��A�ώDTwHj�4��h�$_�-K�%j���5�rj�Ȥ�L�a3�}�2F�uI@�z_�R���T���������Q� 	  �]ܰ�Cf�����W�l��Y���\������`����_j�t��Ÿς�MeiM�E"�r����~�[��+j�K��J���ڙz;J��#7Q�.�ٝ����p��Rl�G��^Jl��AhŨ����GCu�F��+����N��D,�ٚ�-P��H���{}�%N�`�<^v�Kք�&c5�U����k��~��V�vߨ[#yߺI1���}��X�&m򐃆1[�ň����w�j��8��.��D�� Pc@�y�NYJ�s�F��H�����F��Aλ'pܦ��h��(�� ��<��I�ƶ%W��
��@�9q`eo���]�āc�m;
,�6��ä{8K7����T�/x񼊅vI��VUW�>�J	�O@��΂4���%�u��0�܆/-�u$����:�yt����@O����St�:5�tD�̶{��K=LZ1G��q�'��h��{�;� �����{��o̓쁙��A�C}���r£A��R
�Ec2��sH�r�>:����
�P NS���\M���yT5�}���j���1��k"~S��G��Ub�H�l�y�"�2zg�~KH��Q��w��S���{�v�=�� �u��t=�eB��٘�Y F������ژt����_I�lJ [5o����h:�騙� �#��4b�FM��Avٱ6��X��&]b�o�~��i3���t���T�Ekm�\@jv��t)�n��Ξ���gR�.����� �j��~r�1�c�����k��"�tȚ�����O�	`����
}3��/�����IHo��?���t�S���^{�� ������(����uM�]H��]f�iujq�/�����4��Y����tEpZ-c5���XV��˥7q(O�	�oq����/�J?�oC�<Uu�r5Δ�(E��{�3sN��qŢE����u�����T�eSp�����\�Q��:�yC�}Z���Lr�C��}�& ο��6x�J݈y������7�?��,W�q�Ig�Ưװ�<E��R')��h_�q�D�����@!֞u_����5u� H��Z{������)���fr�y4�L�i�Z7a�6��<�G>���K׽�Đ�S��F	�i:��)۸PO�b�N�X��[(�d$8{�����7�J����*��h4]�B�R��N\�
�+��^�V��
�
SVZ��Q*�^_�##E49e	�u$/M6�^�߁���Vc�4�v_S��>�E�]�@l�FbL����*��Tx���x�ٻ�����ޱ���J��o�M��h"���7��y!i�����Tւe����4�J�u�p-��e����m~��PM9*�����h�~��t�@��h�� 5�1󽃹?��>� Olz�Q�����oǎ��l�&�{Ts�.č������Ձ��E���������׮��,�D���먧���"N���'��^pW���V�Vͼ�Γ�{" я�����VR����w2\P#��n�G�v|Rj�.���YQ�(�QҒ�:�ǆG�&#`F��X,i���;� �D�+�߿h���c��]��[7]������ߗ��'�� �#9�=��u]'��(u`���#'I٭�m]��gN���Uj��o+q�KI�&��A'�Y��:l���@���(��@���ӣK����:�?g����M5yKbdMc,�h7P��3b;�>u��Ou��\��~_���])̰.�������B�L�N襽����z�?O�UF      -      x�U�K�$�q�י���@2������7|Jkԃ������}1��z0Y^���*&3��A�/����_�_���ӟ��������p��?��o���o?�oW�������\��m�Ͽ~�����_~������/�S�I�������O���.�����K��Y?����}��G���<�\��������_~��~��]�;�uB.ލ}�K~��y��NM��������`�k���3�ZGwǗ���ŵX�[m���<�����^!��䬳u.�m��k�x�w�i���ￓ����C�{��\�l1�\]_ӻ��m/����w�J镣�E44	2\]1�4Jq���|�ku��y^�R~�t�4VJy���tT(:����{Ƭ5I���ԑ�ˬ×���y�{���Z���r�ryy�V��ב]�+���rM�v��F=��3�k��on���t�v��)��W1<+�+��ԫ��k��Sm�iu�J�O� g���]KI�vg�L�i��}�"��=�>]kW�W��i�ļ�>Z�ӡ�d�9}HYV�}�=J 8�P�^)Y\��z�_���z��;�������/`�丵F��S�-�=�SSϮ�K�⊮�)��%��j��b����C?�}�Ϟ������C�c��>eR��\�4S�fSʙ|��Gy�WM�R�3��NS�HU��"����y�;)@�y�|)�nx]��N���u,��_�������S]ʱ:�>�{����^��U��BA�ϵ3;�C�3
A�X^!_}� K�JU�����v���ޘ滟�(6e%��z;�m��i|�h��_�_+g_w8|M< ��-R�0�`^�k̷���9�����{
>��"`߷�,��Z^U���S��[��+��b��s��aP�]��jQ����p��O�Y��giF������c�AH.�!�Õ^锎2j�k�=5*\z��(K/Jf���[��~_�^:n��K�u31�.H�K>���~3��9ʎ�1����,`Ň.<��q���p���;�y���m�ɦ�0�8��|�{���jt�i��:�*�Ѳ?���gi�2j�.8�@�FMi��zɮ5�Ը�zc�m��t�����I�gD���+@�����&gfC�(�fG�}�kϷ�45��ժB�P7�O������^Z/y�2�$����w͟�<�^�=���'#SN��d�)b�#����z����W��إ2H��42�7v��ĳ���oiza>��7]OHMfQW�XZ��_43�g�5$5̈G��Ba�v�V|:��e'f��bl�.a��B ��6?��F�@V+Z&a��F<��Rl���-������+��̛�^�E� <��H�L�D>"�����}� �.gg��	k�4ae���(n,�]����¤/2��ޤg:�&�#�{ڱ�̝���F��^-�\'��1�iL��W�aj�܆kv�7X@ ��V�]P��GK�/Mv=�qH����Ǯ��1����vw~j��pMIY1�3u�6opY"4���.��ߨ]���g�oK/.F���-�i��b?PU���F��=Z;;2R-w�����<��Q�����M^�]��Cf��d�]dq���}(��y����Mm\s8�H�@3��F-�Cmz��V#�m��� ��¬������\��&�6��2���9�C��C��픐�� *m��e���V�I��0���5;n �N�̺���ӳ�\"����1c��=̍���R�'��t���n�<)�鐞����|�./�.��:;��~S2�;&~Η��d�r��#�gxזNfb���ު�}��Kҫ�+(�H�+ӯb���*xz�7����U��m��<�OC*.2�q�Z
�)�4gO�9a)Aյ7qӂ��r�p6_|w��T��C�Ug�|�,Qח�Ӄ%���mx3� </9���beck�E��\�F6a��F���gi��_�Pi�T�&V�
�¥��
�R��g��E0��%Y��a۳.� z���SƝ�AFW2
�*-�tG�ŷٷ�w{�oi��`F�밇+#�lyf��(���\.,h�)�;��#l(p%�YV}eVZ���B�G��jYP��z$f1�-+g�<D��(����_
�y1Dx��.�ot�$��g�K�)�,u��G�R|w�*ڪz�
 	����@l
{�8��T\�2?�
����1n'=�N��j٫
Ib��O&��m��Dm&,O���Vc[.�d�a���!h;���$��P��=$j�w��5Z/xߨ��!�.!l-���c��ށm���R�,�2��W'�_ݕC�R$P���+㚵6��Si�j��e~�<����Q�Rγt��Uµ�h�~��R�1&�تl�Y-�&��DT!�3Ll�y��fp+a?����S()SEئ�adM���ё�1�'4L���if�]���_�n��nPB�����$���ARqE�����*)��'�i�f��ொ�R�c��#�mn�xbT��%�Z=2�����p��7��d�v-���"1�dfL9� �8@�/dZ�YO�g�Ն��46N��n]J�΅�R����~3��F�,�Q5rC�ՠ�pR�$��	��G�Y�!�w�r������su4B[��a�چ����=�MTl��<Q7ǫU3!:3֝��T�2
��> k��؉a�!n���F�QP�$O�Bfp��ߡ��E�+�%N�=�mh�n��:B���6"�C��5oNb�
W񗏥�t��f?�b�	��;�'br�`B�HL��?���1��}�
�ߝ�ƴ�h�]��v��C_@
C��M�ǎA�$�`rN��e��Do��)��.+���a#��}E�8�s'KV���AXX���0I�8t'�m�
����.4�����ղ��b6���Ql�	��}��ND�v�J�J_��h����R#_>j�.�v6$$F��G�l�<T������i@�U�j�	�q��	���?v����G|{�H�v�G FL�T���*3����=���W�`>�g�t���=�ϔ+�P�c\ȃu�o?��������,Zk�����x�%�̕a�L���v��,�J�����@��m�
]|�G���q��$����1�]�ׁCzMRB|R�U����1��)^˲1�z�$�g<��X
�\����ƴ�^N�w��x�Ǯ��Ǳៈ�f�R����ϖT!̻����0���m�P�����LI&���hI�dB5��!e�ov^�k���<���h"g������j�D����l���xA�f:�j��7FB*W� � MW3�i>9X8��<C��U�cCJ�sh��Ε0��oiގ�ic!��������}/�I��Úd̲�i���a�J�b2�>з�ͩ�[�dA��҈����@��zp��>�L��i.ĉ�%R<�4���-0���(�n� a5D$L��t'��2��u��F�N�(B}5����4�4�-pba�mY_��Ѥ���\<q�H����b'q�o�����t6��|4P�+�O⺷C��-����ҝ?=�{�h��qK�cd�LA ���i�&���I֞#�1�b�ݰ�������zo�7�1w-��9���甞?ţ�2�<�\#{��I�Fz��h�b%��l"h�9�������1�͹�#��YZli��
t�'eQ��Cj&���D��ƣ71,�̠�93�&D!׆pf�߯�Cj2��TF:V1}��'3.��l���s�'@k�E�����~�1_1�1[�xĚi&֥X(����m����=�NsX`�v.��f�����S�F�\��P�tiYt�}�R�Qc�{!=�Xיv~ȸ�a��������
)d{��g�j�Ύ��Ņ��m;�z�x��J�F�s��=���zY(ȽQ�M�� H�6�f7n�.�pC̫)���S��?�� ��q�-��[ǘ��ǎZA��|<K�-�zuJ0"�:;�0�2��阌�ՙG�������ƞ�N�R��<mD&1�D���
i�a�!�u�>.[%v�5��ɛMbv,��6hc�8����� �  Aǁ�h���a"o����z��p<%&�u?��T�K�!6�#+Y��]�.���E;���3��0������s2�Vy�f�<:ol0���0?T���2�%&%��a�-�P;qz_!�֛�6f�6V��P���.'ʉ��g�d��P�(�򶣷jaS((�,:�)6�S�)�R`���[*v:4�=�L�_���a}��&h���Ԑ�]�	v*���Pv������m�o�X�[x�^��&����#6�r�fwkRVW���3$��0cƯƄ�w2`�X�&�ҳI�)�D�`����~���Tm�w���q�D��B>�=�q���b���ip��/Ո��W)O����R�f7d+�)Bb��.vB9Uj�����p��h3�.�D;�&oc�>p�W�/"��_�Y�#̒
�akqD��г�3�GX[��8e�� �F���g���6V��@
�0Tf����Ftz6���g���c
�8�Et�3��jw�!U����e]��a���e�8�n�4&tT� ր�[���&��jj(1���C�8��h��hDN�ݕ%;�hF�X� ��'oT�v��X)��R"�%d<V�>g׌|��&g��M��̞_;��8���2J�n��J���ݓ��.�{L$W	���z�+xÞ7q��y��Ԃه={��PH���d�b�o
�b��_݉��D`b�a�d�9�)�����"2�?A烝��l�����N��4¹����ex��v8�i�,;-��O�!�fQ�;�

��1�����L�#��Wd�h�B��=⥐q;n��6�dMB4���
	���9�aQJftaں�J�9��f�IA4A?�W�	vd���H(;|�}�Ĵ�l�'j�6�%C����C�|>�~��9�ms�X����&S6ڨ��ɜ��>�E`��ɓ)X���q����줶�e\#5M ���{����<Q����}����=u      ,   �  x�e�Y��qƟ�O1`�/��l˔DY�-9�_z��%cH��s�M���W���{^�3$������>|��������E���?>�k?����ڏO�������w�/~z�h�Q����oxz����߮�O��O�m{�������?�zt�����?�~noǇ⟴�����=���y�q==��#_�����}�XkU������??��ϟ����;�쿎��z���c�*�>C�S��s;]�.��5\�9�6�^oߵ����w��r��ǔB�|�X�,n�ܣvqڞ�T��m����0#5��?�����D�bl9��G����tI��s�~��9���7�?�����W�˩]zrqem��:d�u��j?�Ɔ��y����*��JU���>��6��̩k�[�ٛ1�X�Q%���ͫG�T�f6۶γO:��%yݳq��4�rG�tt�F��}ֶ�v�:�����8��c��b?�份�}��
ƙ5��ӣ�]������5�)��:�l�k�d��~��{�^Az�l)z,�C���|�������c
j�h�[��C�C������l�5g?{���*�����w�����]ul18���g���S�(��0�7ڙRL�h]�������Y��߰Q-3kj!�7�q����5�[���
]���u�g�0�֫5��3��3�f��r�� �;!����{fc7#�&��4�&�z�W��_
M%eJ�ֶ�È�ʤJ{��ۗ�ȡ�v��D�W��^�pg%}�^�gt1{k�l��[�۹������3��Ԙ��c3�P�W����Wvֻ����B�7R'+��dX��.����e�0B���sa����A�5�)��Z�X,G�R�]��r�\�w���	VMڋ��2�bh�C'���v���s��[)ST�#�Q��͉�|Xqag�8�b���,���	Ge3�ʂ1� ��U����꽷��F���NАz,�i�7
���A��.�=�t�w�ߤNU m;6^O�8��NeG��v��^�?�\���:D�dl���JM�ca�.�1�26�f����2b6�y��a�Z%n]Wsu�\O�q/�~�j�B��c�E���n�v�0��f�;�Ht�E@kV9,�&1������:'g���m�0�ʻ�"�&��'z�(!��K��M٥�a�T��"��*�KmU�.̚@l��Ɇ�b �'����H����?dh�-���.������]8ÿ@�'��ry􍝀uH,݈9 Kq�=r�j����:��Hm8��	,���֢�=4�j��\y!����f�XfM�A6��K��vxSF[�مh�ԅ��l�@�P;[W�I�n�?�����)���&���qF�L��10�u����FR]2*C��T�}��.�-nӮ��˧����H�"��&��f
�4fH�7�m��A��T��h���, ��9���8�_q5�����h4�˽��]�N���ʬVr�8���?)(���R��r/��K�q1	���J�}�i�e^ �+�b�cA�0/�	a�i���cے�9�p!Q�Ʃ�"��A�uBk9�X{�XY���΁���H��2N'��u�9�^!�>��k��60��΅hD��4B_��t�6]B��a��1kA�//ND���y�-�����p�p����cc6H����D#��UG�Q��Vq1��cA�Mqֺ͙rŅ��N�э�5t��i��7رw_Z´ړ�hDՇ��aZJT�ÀDG��N	!�����y�hD�(dt��.38�X��Xд�2�bB��f���K���Ѡ����ʍJ�4��صim�����H21��E��?�8F�;i���a�?�'^�FT}v�@3Xˤ��q/��a�&L9d�5��5^��X�T�TY䒥���x��i�KMƵ+�s`�B4��KR[���U�!njS�.����$2�k`'��T_�ZvF =5�D�k�Iw���Y��g �/��c�Adb ��0@�&�t��wX�=*tV�-��d�=�"�$�A��-k�|1�"N:�\�FT���Z�&ڜ%-��q�Q��A��y�t!QΪV����0�t�aԈ��{��Hi'��џJ8:f��t��W147��N{F�PK��D&>X
yW��
�0h���f��=9I(]�FT1ajy6IwO��[�-d���HG���Nt!��ԩ�O,0���d\H�ȋ���`a�e�҅�/��(I�nF�wvP*��y�H�AW��d�Ήh45$���YM�F$�v�Q��6{d�2/������x ���Pi��xCG�pΘ�3���_I\G�,��f狼!a8[	��= ]8z�v*]�FTC	�.���!
U��D�hvz4L�u�hD���9��n�h�z#��A��?{�����D��LQ��T�#B$�t`]��؏���D#�Q�]��6��qP-M\��4mC��M��%�:ռ�/�yѓ�����6Z2��Y悳�T��{t�����]Kަ$�naWKT�W*���(VSa��l����N�κ��K�^1�	f�S�9.�(0^A��H�e�aF(UL.���_`�{aUe2��`�7�9p}�P�B�OJݏx:�|A�#���Bx�Ec��r!	��yyM���~�V����F���W�v���0�N�����
�b��hi��������ӥh�X��W�w4{_eN���(�f��n�'�<�� {�׀vV0�w*/`��fp��۸6F��-��M>D��ڳЅc���c�w��JC�mV���c��>y�9�\8FG���#=�S���e�\*�=>�\8FFk�t���Ԛ��(lA�-.�s���QN��W?��tf[4�	���%�`���#��˦�@�T��BDG�@��{��Y�v��-s�M������j�Y,���Dp�����뙭\P�\X'(#>��
�O�K�&�ܛ�r��2P���y��f�H��K�it��$�� �x���P=����)
���1`��3g]�˚ꍼ�Z�'}�h��<�J9�3��d�P?ȋS�B�����z�Y|�C&�1Y�F�|B�Ya�+�d�\_�s�Y^|cF�ƮB�\pb�nZݩl���.W�/@�{oJ�m�-��b{*!U~� /��2M�N���ܛ���2�똦���ɻ(�޽3/=���������\��cLn1Τf��n�z������d5�4�c�p��R����*��*�=��^���C�7�]޲�a�t��MX�����۔��ɻ�U��R�vL/�     