import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_csv('0a289ac5-e28b-4930-ab0a-5ca7ce827c35.csv')
df2 = pd.read_csv('00ac55c6-3e5a-4804-bbb5-016c20d6178a.csv')
df3 = pd.read_csv('0c47fb17-7c6c-459e-b24e-d06664555d52.csv')
df4 = pd.read_csv('0d8b05a4-6a2b-4eed-a95b-0cb78b513a0b.csv')
df5 = pd.read_csv('0e156923-6ea8-4794-ba68-0c46ce96b877.csv')
#df6 = pd.read_csv('1a0e13fb-450d-4aa7-8733-b8056241e41c.csv')
df7 = pd.read_csv('1bacf38c-babd-46d8-85ef-071bde7f69a2.csv')
#df8 = pd.read_csv('1c9a6b82-72ea-4900-9fe6-9cfb2f9db86f.csv')
df9 = pd.read_csv('2a0641bd-abe2-4c26-b884-d1f8f9df5fe2.csv')
df10 = pd.read_csv('2b3d5bcf-7fa8-476e-b32b-8ca831f157f9.csv')
df11 = pd.read_csv('2ba4420c-d500-4911-aac7-f181b069d834.csv')
df12 = pd.read_csv('2cd68a4a-edd6-4b4f-b8d5-4792af4e80fe.csv')
df13 = pd.read_csv('2ebece05-3bf4-437d-ba47-25e45bb207c5.csv')
df14 = pd.read_csv('02f3c8b3-4fe5-4062-9031-b89991380ee9.csv')
df15 = pd.read_csv('3ab71097-383f-4506-ae35-9cb8303c4f4d.csv')
df16 = pd.read_csv('3c69ddd6-a326-464d-bb95-63b9fd4ed541.csv')
df17 = pd.read_csv('3d0eb3a0-0409-47bf-a0c2-3218ab6f8b44.csv')
df18 = pd.read_csv('3d806a1b-33a4-47d7-aa89-6ab47fda2a94.csv')
df19 = pd.read_csv('3f98cad4-2ac7-4185-bef4-893282ef052e.csv')
df20 = pd.read_csv('4a3b8018-747f-42c2-b561-6dda381c8d74.csv')
df21 = pd.read_csv('4a61eb22-6fde-4ab9-8613-77c237ea11e5.csv')
df22 = pd.read_csv('4aad2ed3-084a-4dbc-b598-952b196823dd.csv')
df23 = pd.read_csv('4b5e3f52-7a4a-4a98-90ab-3aace214d9f4.csv')
df24 = pd.read_csv('4bf91b01-ecb8-496d-98b0-f3ed8f3b0095.csv')
df25 = pd.read_csv('4d571f80-b750-4114-a6f3-a19d66443c3e.csv')
df26 = pd.read_csv('4ee60080-ca3d-4082-86c5-b0a96c5ff3eb.csv')
df27 = pd.read_csv('4efcdd82-6be6-4e2e-9ecb-6787ec69b45e.csv')
df28 = pd.read_csv('4f67116e-c649-41d4-9916-8e1f256433df.csv')
df29 = pd.read_csv('5b550bd6-5268-42a5-b287-33b94c93bcfb.csv')
df30 = pd.read_csv('5bd7c0a9-6390-4904-9bc8-f48498b30eae.csv')
df31 = pd.read_csv('6cd77a5c-e0db-4aa5-9521-014e5b2281a3.csv')
df32 = pd.read_csv('6cf9cd04-b9ea-42d1-9d85-4d1169ae9da0.csv')
df33 = pd.read_csv('6f4c6e3b-6cc3-4491-9cb2-97b51f2a41a4.csv')
df34 = pd.read_csv('6fc0c9b9-0d2c-413e-a3be-3f25fbea642d.csv')
df35 = pd.read_csv('8addb036-6b19-455b-bffb-1a5852e184a3.csv')
df36 = pd.read_csv('8b8ea68e-cfc7-433a-8772-2e99e7be9435.csv')
df37 = pd.read_csv('8b105755-fff0-4c3d-9f10-5939ba44c887.csv')
df38 = pd.read_csv('8d07d91f-f42f-45c1-bd54-6f0ffd4ec908.csv')
df39 = pd.read_csv('8e844a32-169d-46b2-88e4-d488bf2838f9.csv')
df40 = pd.read_csv('08ef9192-eb96-4382-bf0c-07f54d872c93.csv')
df41 = pd.read_csv('9a02becf-523c-4a0d-9809-e49c2adb4f00.csv')
df42 = pd.read_csv('9d696e01-3604-490e-8041-1ff0184ccc1e.csv')
df43 = pd.read_csv('0011cef9-0553-4868-9bec-678844bd25bc.csv')
df44 = pd.read_csv('14c2f31a-c235-4c48-b7b7-8a6491ecce4a.csv')
df45 = pd.read_csv('15f5689f-2c9f-4dba-910a-bd1879e59fe5.csv')
df46 = pd.read_csv('16f224a0-c49a-40db-a68e-881f55c88dd1.csv')
df47 = pd.read_csv('21d5fd82-c3b7-4d36-8049-759403f68d81.csv')
df48 = pd.read_csv('22cb9c65-ee24-442e-9fd3-bf2c78b008af.csv')
df49 = pd.read_csv('24e80ec2-5326-4241-ba75-e2bfc0006687.csv')
df50 = pd.read_csv('24fa4262-a951-4b38-b44e-011b08274bef.csv')
df51 = pd.read_csv('026fd528-a7d7-4732-a718-7d3a7573b8b5.csv')
df52 = pd.read_csv('28c7f858-134c-4f6e-9015-bbdd33e68be0.csv')
df53 = pd.read_csv('28d7e925-b15f-4637-ba9a-4a4f8ae7c4bf.csv')
df54 = pd.read_csv('29c194a3-aff8-4c0d-940e-d731fa469f29.csv')
df55 = pd.read_csv('29e73a1a-0efc-4e94-914a-ca40d929c8b9.csv')
df56 = pd.read_csv('33ce8727-f020-410e-bf03-0b5f539016c0.csv')
df57 = pd.read_csv('34d94e32-557b-4216-86e6-a083e3569786.csv')
df58 = pd.read_csv('35c2e294-267c-4357-b097-2222111c3314.csv')
df59 = pd.read_csv('037a8109-e23d-44d1-a434-0773e3f5b40c.csv')
df60 = pd.read_csv('38f28027-9c07-4052-856f-d46f71092020.csv')
df61 = pd.read_csv('40b7f1e1-74a8-471e-ad83-2c86bfa8f56d.csv')
df62 = pd.read_csv('44b0ab55-858d-4d5c-a67d-20573711e925.csv')
df63 = pd.read_csv('48af961a-8e30-41dd-90f0-f66c459563e0.csv')
df64 = pd.read_csv('49c460a0-96a3-4487-a4c7-fe7bea441e6f.csv')
df65 = pd.read_csv('52ca91e1-033f-40f6-9906-d28969448971.csv')
df66 = pd.read_csv('56df58fc-e214-44d8-bc56-19ca8d3dfa22.csv')
df67 = pd.read_csv('61e2044b-ab5b-4986-b9dd-654fa15c488a.csv')
df68 = pd.read_csv('67cac8b8-ad96-43d2-afe4-76f4ba71020b.csv')
df69 = pd.read_csv('70eae7ee-701d-492a-98f0-e70e3385347b.csv')
df70 = pd.read_csv('71d41bd7-5562-4da5-b3a4-d3281648bbf4.csv')
df71 = pd.read_csv('80cb3749-66fa-41e4-bbf6-fd8062831d4f.csv')
df72 = pd.read_csv('81d1b9a0-3515-4625-9054-74f34b639124.csv')
df73 = pd.read_csv('82e75222-df1b-4d21-b0a8-289015ffbd8a.csv')
df74 = pd.read_csv('82fc47a4-b1fb-4ee9-aaa4-7307fc4dc0c0.csv')
df75 = pd.read_csv('84a5aeb1-fa70-41e8-a510-ff76b38f7361.csv')
df76 = pd.read_csv('86a6bb43-c65e-46b2-82bd-e8dbd054a257.csv')
df77 = pd.read_csv('88a85e1b-dd09-4488-ac89-8bf11684445b.csv')
df78 = pd.read_csv('88ed3c4b-0a97-4769-86dd-0be689e044be.csv')
df79 = pd.read_csv('88facfc8-e125-4b72-aad8-5c8513163951.csv')
df80 = pd.read_csv('90fdca7e-d3de-4d5c-b5d7-32026b4e0ab0.csv')
df81 = pd.read_csv('91b26722-84e4-4e47-81fd-31088bf76755.csv')
df82 = pd.read_csv('93e8b0a5-2293-4563-b006-5c0c7f6065e2.csv')
df83 = pd.read_csv('98d50bb9-6b45-456d-a0ae-ffa1fed07ef7.csv')
df84 = pd.read_csv('151df61f-f30e-47ed-8075-51176358ea26.csv')
df85 = pd.read_csv('162e5470-6857-412a-8da9-9aa8a92293fa.csv')
df86 = pd.read_csv('177f969c-e2e4-4e99-8add-1dfe48d932ca.csv')
df87 = pd.read_csv('318e6cef-ccd0-49f0-8061-2db25146e1df.csv')
df88 = pd.read_csv('357d14c3-301a-44f1-8da9-f027469f0a30.csv')
df89 = pd.read_csv('443a71b4-9fa0-4a5b-a813-ce60ce55f1a4.csv')
df90 = pd.read_csv('519e6b58-7946-4cbd-99d8-bbdbd7634799.csv')
df91 = pd.read_csv('557d0dbd-4418-400e-ab45-5487ceeb126f.csv')
df92 = pd.read_csv('597d1955-3d92-4353-9a51-57afead17795.csv')
df93 = pd.read_csv('618e20d4-fddb-4d54-964a-bc04f91216c2.csv')
df94 = pd.read_csv('633b12e4-8396-416c-9f3b-4d9b17aa882e.csv')
df95 = pd.read_csv('738ea32d-a14b-4b3d-989d-26493cb0f6a0.csv')
df96 = pd.read_csv('745b25a5-db3f-4184-87d4-f27ff52eb57b.csv')
df97 = pd.read_csv('775d2617-5e60-4af9-ab69-d832690d323f.csv')
df98 = pd.read_csv('791c7d03-1b5c-46f3-82f5-ccc7f7032be8.csv')
df99 = pd.read_csv('1621a18f-5386-4f1b-83e3-de0323d1401c.csv')
df100 = pd.read_csv('1897f91f-b514-4907-baf3-54bc0aec3c6f.csv')
df101 = pd.read_csv('3839f5db-1720-49c0-8653-5c65b40e4a4e.csv')
df102 = pd.read_csv('3907bdb5-c05b-4b99-89ab-25957462100a.csv')
df103 = pd.read_csv('7643ac41-e985-4310-b77d-38e6b1201371.csv')
df104 = pd.read_csv('07708a25-f797-4c05-aaee-be3c274b1353.csv')
df105 = pd.read_csv('8530ec49-d99d-4308-a532-3c47d3bc999c.csv')
df106 = pd.read_csv('9481fc27-ee44-4f51-b9c2-19fe25252863.csv')
df107 = pd.read_csv('12857af4-3c91-4b80-85df-0e22b6242639.csv')
df108 = pd.read_csv('35258bb6-0c5b-43f5-b2ab-b7f04f5b8f64.csv')
df109 = pd.read_csv('46974b43-8360-4e5e-b68c-f92f4798d2ba.csv')
df110 = pd.read_csv('66142e9e-6ede-493d-8db1-f91d0da2c625.csv')
df111 = pd.read_csv('74787a9a-7b6e-4bae-9aba-d39b14056c36.csv')
df112 = pd.read_csv('81437d58-3085-45c0-93c7-669f2b43fd7f.csv')
df113 = pd.read_csv('168548b3-af6f-489e-93ef-3a68f99fa8f9.csv')
df114 = pd.read_csv('880919e8-0fc4-440e-8e2a-133af84fc7e6.csv')
df115 = pd.read_csv('5450903b-d6e1-4bf3-87af-ce4040df57d7.csv')
df116 = pd.read_csv('32887673-ebb6-4c62-b278-6ef50c8930ce.csv')
df117 = pd.read_csv('35389828-4337-41da-9c37-25e6504daf57.csv')
df118 = pd.read_csv('48930569-cf3a-4caa-a416-5dfeada2f7d9.csv')
df119 = pd.read_csv('a1a74162-6996-4f71-a0f6-0d727674c9f4.csv')
df120 = pd.read_csv('a1cd3b09-8439-4096-b639-e101d2dc5830.csv')
df121 = pd.read_csv('a3e67c3b-bb6e-4085-a962-382238dc7af4.csv')
df122 = pd.read_csv('a4c3f909-86d0-4fde-a2d3-1c1415197ba3.csv')
df123 = pd.read_csv('a9d7ee45-c925-4137-a6c1-05f4dc559632.csv')
df124 = pd.read_csv('a67e3c6e-461a-4683-9bcb-cce04a58ea18.csv')
df125 = pd.read_csv('a298a686-5239-4ab9-8168-1b240f6c90b6.csv')
df126 = pd.read_csv('a97847b1-0a8d-4d2a-916e-b13ef77f58c8.csv')
df127 = pd.read_csv('a3627867-2d52-41ee-86ec-919e77dc21c0.csv')
df128 = pd.read_csv('a4125939-0ddd-4d36-9ff4-5492380083f8.csv')
df129 = pd.read_csv('acc39cc3-051b-4b98-ad68-9faa612c6af2.csv')
#id_df130 = pd.read_csv('b04dd0c5-75fb-4847-a2d9-6fa77fa268d0.csv')
df131 = pd.read_csv('b27fe330-6e52-482c-984f-eebd5a32a93c.csv')
df132 = pd.read_csv('b45ea4f0-7bb8-433b-a832-31c0aa15e5e4.csv')
df133 = pd.read_csv('b422ce7e-6427-463b-85e7-55486f289a88.csv')
df134 = pd.read_csv('ba6d6588-92e1-46ed-a52b-c1f947e95153.csv')
df135 = pd.read_csv('ba54a4d0-2d9e-46a1-b056-7fa6a3f08cce.csv')
df136 = pd.read_csv('bba5f674-c6dd-4f1a-b462-04330c6587d5.csv')
df137 = pd.read_csv('bd041669-6f01-4005-8d8a-7ef97675e21c.csv')
df138 = pd.read_csv('c6ef32fb-14d5-4041-9aed-278a483c6755.csv')
df139 = pd.read_csv('c8a5b55c-f45f-423a-8838-27115815f108.csv')
df140 = pd.read_csv('c170bca7-7149-491a-9ca4-7b7e1f34c8b5.csv')
df141 = pd.read_csv('c945f125-5a66-402a-8098-e19833e2eabb.csv')
df142 = pd.read_csv('c2036175-60e5-4447-8289-400a1f697081.csv')
df143 = pd.read_csv('cc4c7c89-900c-4d8a-bad9-9b6ae8504d4f.csv')
df144 = pd.read_csv('cec8b173-141d-4326-8c27-f4e171d3c69e.csv')
df145 = pd.read_csv('d5bb2bd8-11ad-4e74-bac9-381bd759737a.csv')
df146 = pd.read_csv('d020c3ec-5070-411b-aa94-cbe4d8c45b67.csv')
df147 = pd.read_csv('d46b281f-98c5-49e3-bbb4-fcc8e17d4af2.csv')
df148 = pd.read_csv('d95b3e4d-58a7-41ac-be88-62d81b36ad42.csv')
df149 = pd.read_csv('d124b0b0-7a9f-44f3-97d8-a294f0e4f801.csv')
df150 = pd.read_csv('d5684e6f-4fc4-47d0-bcad-0a1549142990.csv')
df151 = pd.read_csv('da7f59f7-4551-42cb-980c-0034d155e78b.csv')
df152 = pd.read_csv('db3dc4be-78c2-49fa-8de4-2796bb601834.csv')
df153 = pd.read_csv('df10b5d5-45b2-4714-a425-29b058f788ed.csv')
df154 = pd.read_csv('df58b610-a794-496e-b774-cc86350f91b5.csv')
df155 = pd.read_csv('df387682-5b6d-4d99-bbdc-24d11b4e90ff.csv')
df156 = pd.read_csv('dfc54346-7f9f-4023-80ac-9f0c84244f21.csv')
df157 = pd.read_csv('dfeaf0e9-4321-4b5e-9b6b-7ffc4969f427.csv')
df158 = pd.read_csv('dff9ff56-817f-450a-8af9-7fb04d260aee.csv')
df159 = pd.read_csv('e2aa0cb2-768c-4a13-9df2-08d5fd3d407b.csv')
df160 = pd.read_csv('e02c43a8-2fa5-4e3a-80d7-5868615e17d8.csv')
df161 = pd.read_csv('e8a6ea85-c2c1-4e64-ba2b-ae9eedba5245.csv')
df162 = pd.read_csv('e9c309e6-0d92-44a9-b2e5-929b51524144.csv')
df163 = pd.read_csv('e16f749e-3eb4-49f1-9bab-88c3beee2783.csv')
df164 = pd.read_csv('e26e5275-cb7e-4c30-8802-8c154a10f3ff.csv')
#id_df165 = pd.read_csv('e98a07b7-1053-4d13-b2a9-dc6cbfdec510.csv')
df166 = pd.read_csv('e686d174-331d-43e1-a62c-89e871f1898e.csv')
df167 = pd.read_csv('e0717df2-f74e-4992-ae37-92c64714302e.csv')
df168 = pd.read_csv('e19301fc-663c-43bc-95f2-114c59891191.csv')
df169 = pd.read_csv('ea73fb53-11b0-42de-a030-b5eb96e1f81a.csv')
df170 = pd.read_csv('ec53d64a-f980-42c7-af9a-a601c9ac5eaa.csv')
df171 = pd.read_csv('ed73d109-acc7-4f53-8e35-7a1f6e5249d7.csv')
df172 = pd.read_csv('ee4d0924-33ee-4c4c-80dc-5080622a27e4.csv')
df173 = pd.read_csv('f2d5029e-36d0-4a1e-8ea4-1b9ef6cf9d86.csv')
df174 = pd.read_csv('f3b15ea1-0650-47d6-8973-a8a5d0aca047.csv')
df175 = pd.read_csv('f5d9af46-76a6-4660-acd9-20f2141bb089.csv')
df176 = pd.read_csv('f7db4ccb-c3b3-4f72-adcc-3169d63947f1.csv')
#id_df177 = pd.read_csv('f43a7857-0281-42de-9d14-4baad8632c25.csv')
df178 = pd.read_csv('f76b36b7-21f4-4f0f-9462-3bd5c3fc7163.csv')
df179 = pd.read_csv('f94c007d-a12d-41ff-b1fb-5b44bc881158.csv')
df180 = pd.read_csv('f7435c00-f7c2-485c-b185-e038259f61b2.csv')
#id_df181 = pd.read_csv('f2523133-2268-4053-b04d-508ba66736a8.csv')
df182 = pd.read_csv('f3488291-6a13-4d6e-8652-7438bd840156.csv')
df183 = pd.read_csv('fa702153-e3e2-4834-bd0c-9e3a620ef0dc.csv')
df184 = pd.read_csv('fe85a25c-6e69-4c46-a00d-152d6237170f.csv')

# Retrive all ID's from files and store them in array
id1 = np.array(df1['id'])
id2 = np.array(df2['id'])
id3 = np.array(df3['id'])
id4 = np.array(df4['id'])
id5 = np.array(df5['id'])
#id6 = np.array(df6['id'])
id7 = np.array(df7['id'])
#id8 = np.array(df8['id'])
id9 = np.array(df9['id'])
id10 = np.array(df10['id'])
id11 = np.array(df11['id'])
id12 = np.array(df12['id'])
id13 = np.array(df13['id'])
id14 = np.array(df14['id'])
id15 = np.array(df15['id'])
id16 = np.array(df16['id'])
id17 = np.array(df17['id'])
id18 = np.array(df18['id'])
id19 = np.array(df19['id'])
id20 = np.array(df20['id'])
id21 = np.array(df21['id'])
id22 = np.array(df22['id'])
id23 = np.array(df23['id'])
id24 = np.array(df24['id'])
id25 = np.array(df25['id'])
id26 = np.array(df26['id'])
id27 = np.array(df27['id'])
id28 = np.array(df28['id'])
id29 = np.array(df29['id'])
id30 = np.array(df30['id'])
id31 = np.array(df31['id'])
id32 = np.array(df32['id'])
id33 = np.array(df33['id'])
id34 = np.array(df34['id'])
id35 = np.array(df35['id'])
id36 = np.array(df36['id'])
id37 = np.array(df37['id'])
id38 = np.array(df38['id'])
id39 = np.array(df39['id'])
id40 = np.array(df40['id'])
id41 = np.array(df41['id'])
id42 = np.array(df42['id'])
id43 = np.array(df43['id'])
id44 = np.array(df44['id'])
id45 = np.array(df45['id'])
id46 = np.array(df46['id'])
id47 = np.array(df47['id'])
id48 = np.array(df48['id'])
id49 = np.array(df49['id'])
id50 = np.array(df50['id'])
id51 = np.array(df51['id'])
id52 = np.array(df52['id'])
id53 = np.array(df53['id'])
id54 = np.array(df54['id'])
id55 = np.array(df55['id'])
id56 = np.array(df56['id'])
id57 = np.array(df57['id'])
id58 = np.array(df58['id'])
id59 = np.array(df59['id'])
id60 = np.array(df60['id'])
id61 = np.array(df61['id'])
id62 = np.array(df62['id'])
id63 = np.array(df63['id'])
id64 = np.array(df64['id'])
id65 = np.array(df65['id'])
id66 = np.array(df66['id'])
id67 = np.array(df67['id'])
id68 = np.array(df68['id'])
id69 = np.array(df69['id'])
id70 = np.array(df70['id'])
id71 = np.array(df71['id'])
id72 = np.array(df72['id'])
id73 = np.array(df73['id'])
id74 = np.array(df74['id'])
id75 = np.array(df75['id'])
id76 = np.array(df76['id'])
id77 = np.array(df77['id'])
id78 = np.array(df78['id'])
id79 = np.array(df79['id'])
id80 = np.array(df80['id'])
id81 = np.array(df81['id'])
id82 = np.array(df82['id'])
id83 = np.array(df83['id'])
id84 = np.array(df84['id'])
id85 = np.array(df85['id'])
id86 = np.array(df86['id'])
id87 = np.array(df87['id'])
id88 = np.array(df88['id'])
id89 = np.array(df89['id'])
id90 = np.array(df90['id'])
id91 = np.array(df91['id'])
id92 = np.array(df92['id'])
id93 = np.array(df93['id'])
id94 = np.array(df94['id'])
id95 = np.array(df95['id'])
id96 = np.array(df96['id'])
id97 = np.array(df97['id'])
id98 = np.array(df98['id'])
id99 = np.array(df99['id'])
id100 = np.array(df100['id'])
id101 = np.array(df101['id'])
id102 = np.array(df102['id'])
id103 = np.array(df103['id'])
id104 = np.array(df104['id'])
id105 = np.array(df105['id'])
id106 = np.array(df106['id'])
id107 = np.array(df107['id'])
id108 = np.array(df108['id'])
id109 = np.array(df109['id'])
id110 = np.array(df110['id'])
id111 = np.array(df111['id'])
id112 = np.array(df112['id'])
id113 = np.array(df113['id'])
id114 = np.array(df114['id'])
id115 = np.array(df115['id'])
id116 = np.array(df116['id'])
id117 = np.array(df117['id'])
id118 = np.array(df118['id'])
id119 = np.array(df119['id'])
id120 = np.array(df120['id'])
id121 = np.array(df121['id'])
id122 = np.array(df122['id'])
id123 = np.array(df123['id'])
id124 = np.array(df124['id'])
id125 = np.array(df125['id'])
id126 = np.array(df126['id'])
id127 = np.array(df127['id'])
id128 = np.array(df128['id'])
id129 = np.array(df129['id'])
#id130 = np.array(df130['id'])
id131 = np.array(df131['id'])
id132 = np.array(df132['id'])
id133 = np.array(df133['id'])
id134 = np.array(df134['id'])
id135 = np.array(df135['id'])
id136 = np.array(df136['id'])
id137 = np.array(df137['id'])
id138 = np.array(df138['id'])
id139 = np.array(df139['id'])
id140 = np.array(df140['id'])
id141 = np.array(df141['id'])
id142 = np.array(df142['id'])
id143 = np.array(df143['id'])
id144 = np.array(df144['id'])
id145 = np.array(df145['id'])
id146 = np.array(df146['id'])
id147 = np.array(df147['id'])
id148 = np.array(df148['id'])
id149 = np.array(df149['id'])
id150 = np.array(df150['id'])
id151 = np.array(df151['id'])
id152 = np.array(df152['id'])
id153 = np.array(df153['id'])
id154 = np.array(df154['id'])
id155 = np.array(df155['id'])
id156 = np.array(df156['id'])
id157 = np.array(df157['id'])
id158 = np.array(df158['id'])
id159 = np.array(df159['id'])
id160 = np.array(df160['id'])
id161 = np.array(df161['id'])
id162 = np.array(df162['id'])
id163 = np.array(df163['id'])
id164 = np.array(df164['id'])
#id165 = np.array(df165['id'])
id166 = np.array(df166['id'])
id167 = np.array(df167['id'])
id168 = np.array(df168['id'])
id169 = np.array(df169['id'])
id170 = np.array(df170['id'])
id171 = np.array(df171['id'])
id172 = np.array(df172['id'])
id173 = np.array(df173['id'])
id174 = np.array(df174['id'])
id175 = np.array(df175['id'])
id176 = np.array(df176['id'])
#id177 = np.array(df177['id'])
id178 = np.array(df178['id'])
id179 = np.array(df179['id'])
id180 = np.array(df180['id'])
#id181 = np.array(df181['id'])
id182 = np.array(df182['id'])
id183 = np.array(df183['id'])
id184 = np.array(df184['id'])

np.concatenate((id1, id2, id3,id4,id5,id7,id9,
               id10,id11,id12,id13,id14,id15,id16,id17,id18,id19,
               id20,id21,id22,id23,id24,id25,id26,id27,id28,id29,
               id30,id31,id32,id33,id34,id35,id36,id37,id38,id39,
               id40,id41,id42,id43,id44,id45,id46,id47,id48,id49,
               id50,id51,id52,id53,id54,id55,id56,id57,id58,id59,
               id60,id61,id62,id63,id64,id65,id66,id67,id68,id69,
               id70,id71,id72,id73,id74,id75,id76,id77,id78,id79,
               id80,id81,id82,id83,id84,id85,id86,id87,id88,id89,
               id90,id91,id92,id93,id94,id95,id96,id97,id98,id99,
               id100,id101,id102,id103,id104,id105,id106,id107,id108,id109,
               id110,id111,id112,id113,id114,id115,id116,id117,id118,id119,
               id120,id121,id122,id123,id124,id125,id126,id127,id128,id129,
               id131,id132,id133,id134,id135,id136,id137,id138,id139,
               id140,id141,id142,id143,id144,id145,id146,id147,id148,id149,
               id150,id151,id152,id153,id154,id155,id156,id157,id158,id159,
               id160,id161,id162,id163,id164,id166,id167,id168,id169,
               id170,id171,id172,id173,id174,id175,id176,id178,id179,
               id180,id182,id183,id184))

# Retrive all X's from files and store them in array
x1 = np.array(df1['x'])
x2 = np.array(df2['x'])
x3 = np.array(df3['x'])
x4 = np.array(df4['x'])
x5 = np.array(df5['x'])
#x6 = np.array(df6['x'])
x7 = np.array(df7['x'])
#x8 = np.array(df8['x'])
x9 = np.array(df9['x'])
x10 = np.array(df10['x'])
x11 = np.array(df11['x'])
x12 = np.array(df12['x'])
x13 = np.array(df13['x'])
x14 = np.array(df14['x'])
x15 = np.array(df15['x'])
x16 = np.array(df16['x'])
x17 = np.array(df17['x'])
x18 = np.array(df18['x'])
x19 = np.array(df19['x'])
x20 = np.array(df20['x'])
x21 = np.array(df21['x'])
x22 = np.array(df22['x'])
x23 = np.array(df23['x'])
x24 = np.array(df24['x'])
x25 = np.array(df25['x'])
x26 = np.array(df26['x'])
x27 = np.array(df27['x'])
x28 = np.array(df28['x'])
x29 = np.array(df29['x'])
x30 = np.array(df30['x'])
x31 = np.array(df31['x'])
x32 = np.array(df32['x'])
x33 = np.array(df33['x'])
x34 = np.array(df34['x'])
x35 = np.array(df35['x'])
x36 = np.array(df36['x'])
x37 = np.array(df37['x'])
x38 = np.array(df38['x'])
x39 = np.array(df39['x'])
x40 = np.array(df40['x'])
x41 = np.array(df41['x'])
x42 = np.array(df42['x'])
x43 = np.array(df43['x'])
x44 = np.array(df44['x'])
x45 = np.array(df45['x'])
x46 = np.array(df46['x'])
x47 = np.array(df47['x'])
x48 = np.array(df48['x'])
x49 = np.array(df49['x'])
x50 = np.array(df50['x'])
x51 = np.array(df51['x'])
x52 = np.array(df52['x'])
x53 = np.array(df53['x'])
x54 = np.array(df54['x'])
x55 = np.array(df55['x'])
x56 = np.array(df56['x'])
x57 = np.array(df57['x'])
x58 = np.array(df58['x'])
x59 = np.array(df59['x'])
x60 = np.array(df60['x'])
x61 = np.array(df61['x'])
x62 = np.array(df62['x'])
x63 = np.array(df63['x'])
x64 = np.array(df64['x'])
x65 = np.array(df65['x'])
x66 = np.array(df66['x'])
x67 = np.array(df67['x'])
x68 = np.array(df68['x'])
x69 = np.array(df69['x'])
x70 = np.array(df70['x'])
x71 = np.array(df71['x'])
x72 = np.array(df72['x'])
x73 = np.array(df73['x'])
x74 = np.array(df74['x'])
x75 = np.array(df75['x'])
x76 = np.array(df76['x'])
x77 = np.array(df77['x'])
x78 = np.array(df78['x'])
x79 = np.array(df79['x'])
x80 = np.array(df80['x'])
x81 = np.array(df81['x'])
x82 = np.array(df82['x'])
x83 = np.array(df83['x'])
x84 = np.array(df84['x'])
x85 = np.array(df85['x'])
x86 = np.array(df86['x'])
x87 = np.array(df87['x'])
x88 = np.array(df88['x'])
x89 = np.array(df89['x'])
x90 = np.array(df90['x'])
x91 = np.array(df91['x'])
x92 = np.array(df92['x'])
x93 = np.array(df93['x'])
x94 = np.array(df94['x'])
x95 = np.array(df95['x'])
x96 = np.array(df96['x'])
x97 = np.array(df97['x'])
x98 = np.array(df98['x'])
x99 = np.array(df99['x'])
x100 = np.array(df100['x'])
x101 = np.array(df101['x'])
x102 = np.array(df102['x'])
x103 = np.array(df103['x'])
x104 = np.array(df104['x'])
x105 = np.array(df105['x'])
x106 = np.array(df106['x'])
x107 = np.array(df107['x'])
x108 = np.array(df108['x'])
x109 = np.array(df109['x'])
x110 = np.array(df110['x'])
x111 = np.array(df111['x'])
x112 = np.array(df112['x'])
x113 = np.array(df113['x'])
x114 = np.array(df114['x'])
x115 = np.array(df115['x'])
x116 = np.array(df116['x'])
x117 = np.array(df117['x'])
x118 = np.array(df118['x'])
x119 = np.array(df119['x'])
x120 = np.array(df120['x'])
x121 = np.array(df121['x'])
x122 = np.array(df122['x'])
x123 = np.array(df123['x'])
x124 = np.array(df124['x'])
x125 = np.array(df125['x'])
x126 = np.array(df126['x'])
x127 = np.array(df127['x'])
x128 = np.array(df128['x'])
x129 = np.array(df129['x'])
#x130 = np.array(df130['x'])
x131 = np.array(df131['x'])
x132 = np.array(df132['x'])
x133 = np.array(df133['x'])
x134 = np.array(df134['x'])
x135 = np.array(df135['x'])
x136 = np.array(df136['x'])
x137 = np.array(df137['x'])
x138 = np.array(df138['x'])
x139 = np.array(df139['x'])
x140 = np.array(df140['x'])
x141 = np.array(df141['x'])
x142 = np.array(df142['x'])
x143 = np.array(df143['x'])
x144 = np.array(df144['x'])
x145 = np.array(df145['x'])
x146 = np.array(df146['x'])
x147 = np.array(df147['x'])
x148 = np.array(df148['x'])
x149 = np.array(df149['x'])
x150 = np.array(df150['x'])
x151 = np.array(df151['x'])
x152 = np.array(df152['x'])
x153 = np.array(df153['x'])
x154 = np.array(df154['x'])
x155 = np.array(df155['x'])
x156 = np.array(df156['x'])
x157 = np.array(df157['x'])
x158 = np.array(df158['x'])
x159 = np.array(df159['x'])
x160 = np.array(df160['x'])
x161 = np.array(df161['x'])
x162 = np.array(df162['x'])
x163 = np.array(df163['x'])
x164 = np.array(df164['x'])
#x165 = np.array(df165['x'])
x166 = np.array(df166['x'])
x167 = np.array(df167['x'])
x168 = np.array(df168['x'])
x169 = np.array(df169['x'])
x170 = np.array(df170['x'])
x171 = np.array(df171['x'])
x172 = np.array(df172['x'])
x173 = np.array(df173['x'])
x174 = np.array(df174['x'])
x175 = np.array(df175['x'])
x176 = np.array(df176['x'])
#x177 = np.array(df177['x'])
x178 = np.array(df178['x'])
x179 = np.array(df179['x'])
x180 = np.array(df180['x'])
#x181 = np.array(df181['x'])
x182 = np.array(df182['x'])
x183 = np.array(df183['x'])
x184 = np.array(df184['x'])

x_axis = np.concatenate((x1,x2,x3,x4,x5,x7,x9,
                        x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,
                        x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,
                        x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,
                        x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,
                        x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,
                        x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,
                        x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,
                        x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,
                        x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,
                        x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,
                        x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,
                        x120,x121,x122,x123,x124,x125,x126,x127,x128,x129,
                        x131,x132,x133,x134,x135,x136,x137,x138,x139,
                        x140,x141,x142,x143,x144,x145,x146,x147,x148,x149,
                        x150,x151,x152,x153,x154,x155,x156,x157,x158,x159,
                        x160,x161,x162,x163,x164,x166,x167,x168,x169,
                        x170,x171,x172,x173,x174,x175,x176,x178,x179,
                        x180,x182,x183,x184))

y1 = np.array(df1['y'])
y2 = np.array(df2['y'])
y3 = np.array(df3['y'])
y4 = np.array(df4['y'])
y5 = np.array(df5['y'])
#y6 = np.array(df6['y'])
y7 = np.array(df7['y'])
#y8 = np.array(df8['y'])
y9 = np.array(df9['y'])
y10 = np.array(df10['y'])
y11 = np.array(df11['y'])
y12 = np.array(df12['y'])
y13 = np.array(df13['y'])
y14 = np.array(df14['y'])
y15 = np.array(df15['y'])
y16 = np.array(df16['y'])
y17 = np.array(df17['y'])
y18 = np.array(df18['y'])
y19 = np.array(df19['y'])
y20 = np.array(df20['y'])
y21 = np.array(df21['y'])
y22 = np.array(df22['y'])
y23 = np.array(df23['y'])
y24 = np.array(df24['y'])
y25 = np.array(df25['y'])
y26 = np.array(df26['y'])
y27 = np.array(df27['y'])
y28 = np.array(df28['y'])
y29 = np.array(df29['y'])
y30 = np.array(df30['y'])
y31 = np.array(df31['y'])
y32 = np.array(df32['y'])
y33 = np.array(df33['y'])
y34 = np.array(df34['y'])
y35 = np.array(df35['y'])
y36 = np.array(df36['y'])
y37 = np.array(df37['y'])
y38 = np.array(df38['y'])
y39 = np.array(df39['y'])
y40 = np.array(df40['y'])
y41 = np.array(df41['y'])
y42 = np.array(df42['y'])
y43 = np.array(df43['y'])
y44 = np.array(df44['y'])
y45 = np.array(df45['y'])
y46 = np.array(df46['y'])
y47 = np.array(df47['y'])
y48 = np.array(df48['y'])
y49 = np.array(df49['y'])
y50 = np.array(df50['y'])
y51 = np.array(df51['y'])
y52 = np.array(df52['y'])
y53 = np.array(df53['y'])
y54 = np.array(df54['y'])
y55 = np.array(df55['y'])
y56 = np.array(df56['y'])
y57 = np.array(df57['y'])
y58 = np.array(df58['y'])
y59 = np.array(df59['y'])
y60 = np.array(df60['y'])
y61 = np.array(df61['y'])
y62 = np.array(df62['y'])
y63 = np.array(df63['y'])
y64 = np.array(df64['y'])
y65 = np.array(df65['y'])
y66 = np.array(df66['y'])
y67 = np.array(df67['y'])
y68 = np.array(df68['y'])
y69 = np.array(df69['y'])
y70 = np.array(df70['y'])
y71 = np.array(df71['y'])
y72 = np.array(df72['y'])
y73 = np.array(df73['y'])
y74 = np.array(df74['y'])
y75 = np.array(df75['y'])
y76 = np.array(df76['y'])
y77 = np.array(df77['y'])
y78 = np.array(df78['y'])
y79 = np.array(df79['y'])
y80 = np.array(df80['y'])
y81 = np.array(df81['y'])
y82 = np.array(df82['y'])
y83 = np.array(df83['y'])
y84 = np.array(df84['y'])
y85 = np.array(df85['y'])
y86 = np.array(df86['y'])
y87 = np.array(df87['y'])
y88 = np.array(df88['y'])
y89 = np.array(df89['y'])
y90 = np.array(df90['y'])
y91 = np.array(df91['y'])
y92 = np.array(df92['y'])
y93 = np.array(df93['y'])
y94 = np.array(df94['y'])
y95 = np.array(df95['y'])
y96 = np.array(df96['y'])
y97 = np.array(df97['y'])
y98 = np.array(df98['y'])
y99 = np.array(df99['y'])
y100 = np.array(df100['y'])
y101 = np.array(df101['y'])
y102 = np.array(df102['y'])
y103 = np.array(df103['y'])
y104 = np.array(df104['y'])
y105 = np.array(df105['y'])
y106 = np.array(df106['y'])
y107 = np.array(df107['y'])
y108 = np.array(df108['y'])
y109 = np.array(df109['y'])
y110 = np.array(df110['y'])
y111 = np.array(df111['y'])
y112 = np.array(df112['y'])
y113 = np.array(df113['y'])
y114 = np.array(df114['y'])
y115 = np.array(df115['y'])
y116 = np.array(df116['y'])
y117 = np.array(df117['y'])
y118 = np.array(df118['y'])
y119 = np.array(df119['y'])
y120 = np.array(df120['y'])
y121 = np.array(df121['y'])
y122 = np.array(df122['y'])
y123 = np.array(df123['y'])
y124 = np.array(df124['y'])
y125 = np.array(df125['y'])
y126 = np.array(df126['y'])
y127 = np.array(df127['y'])
y128 = np.array(df128['y'])
y129 = np.array(df129['y'])
#y130 = np.array(df130['y'])
y131 = np.array(df131['y'])
y132 = np.array(df132['y'])
y133 = np.array(df133['y'])
y134 = np.array(df134['y'])
y135 = np.array(df135['y'])
y136 = np.array(df136['y'])
y137 = np.array(df137['y'])
y138 = np.array(df138['y'])
y139 = np.array(df139['y'])
y140 = np.array(df140['y'])
y141 = np.array(df141['y'])
y142 = np.array(df142['y'])
y143 = np.array(df143['y'])
y144 = np.array(df144['y'])
y145 = np.array(df145['y'])
y146 = np.array(df146['y'])
y147 = np.array(df147['y'])
y148 = np.array(df148['y'])
y149 = np.array(df149['y'])
y150 = np.array(df150['y'])
y151 = np.array(df151['y'])
y152 = np.array(df152['y'])
y153 = np.array(df153['y'])
y154 = np.array(df154['y'])
y155 = np.array(df155['y'])
y156 = np.array(df156['y'])
y157 = np.array(df157['y'])
y158 = np.array(df158['y'])
y159 = np.array(df159['y'])
y160 = np.array(df160['y'])
y161 = np.array(df161['y'])
y162 = np.array(df162['y'])
y163 = np.array(df163['y'])
y164 = np.array(df164['y'])
#y165 = np.array(df165['y'])
y166 = np.array(df166['y'])
y167 = np.array(df167['y'])
y168 = np.array(df168['y'])
y169 = np.array(df169['y'])
y170 = np.array(df170['y'])
y171 = np.array(df171['y'])
y172 = np.array(df172['y'])
y173 = np.array(df173['y'])
y174 = np.array(df174['y'])
y175 = np.array(df175['y'])
y176 = np.array(df176['y'])
#y177 = np.array(df177['y'])
y178 = np.array(df178['y'])
y179 = np.array(df179['y'])
y180 = np.array(df180['y'])
#y181 = np.array(df181['y'])
y182 = np.array(df182['y'])
y183 = np.array(df183['y'])
y184 = np.array(df184['y'])
y_axis = np.concatenate((y1,y2,y3,y4,y5,y7,y9,
                        y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,
                        y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,
                        y30,y31,y32,y33,y34,y35,y36,y37,y38,y39,
                        y40,y41,y42,y43,y44,y45,y46,y47,y48,y49,
                        y50,y51,y52,y53,y54,y55,y56,y57,y58,y59,
                        y60,y61,y62,y63,y64,y65,y66,y67,y68,y69,
                        y70,y71,y72,y73,y74,y75,y76,y77,y78,y79,
                        y80,y81,y82,y83,y84,y85,y86,y87,y88,y89,
                        y90,y91,y92,y93,y94,y95,y96,y97,y98,y99,
                        y100,y101,y102,y103,y104,y105,y106,y107,y108,y109,
                        y110,y111,y112,y113,y114,y115,y116,y117,y118,y119,
                        y120,y121,y122,y123,y124,y125,y126,y127,y128,y129,
                        y131,y132,y133,y134,y135,y136,y137,y138,y139,
                        y140,y141,y142,y143,y144,y145,y146,y147,y148,y149,
                        y150,y151,y152,y153,y154,y155,y156,y157,y158,y159,
                        y160,y161,y162,y163,y164,y166,y167,y168,y169,
                        y170,y171,y172,y173,y174,y175,y176,y178,y179,
                        y180,y182,y183,y184))

plt.plot(y_axis, x_axis, 'ro')
plt.axis([0, 5000, 0, 500])
plt.show()