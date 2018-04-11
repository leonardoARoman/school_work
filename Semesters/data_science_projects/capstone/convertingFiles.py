import pandas as pd
data_xls1 = pd.read_excel('CRAC_12_Failure_Data_65F_supply_air_temp.xlsx')
data_xls2 = pd.read_excel('Steady_State_Data_77_supply_air_temp.xlsx')
data_xls3 = pd.read_excel('Transient_Data_77F_supply_air_temp.xlsx')

#data_xls1.to_csv('CRAC_12_Failure_Data_65F_supply_air_temp.csv', encoding='utf-8')
#data_xls2.to_csv('Steady_State_Data_77_supply_air_temp.csv', encoding='utf-8')
#data_xls3.to_csv('Transient_Data_77F_supply_air_temp.csv', encoding='utf-8',index=False)


# Converting xml to csv

import xml.etree.cElementTree as et

# return an ElementTree object,
# “getroot()” to get the root element for this tree, and then iterate all elements.
def getvalueofnode(node):
    """ return node text or None """
    return node.text if node is not None else None


def main():
    """ main """
    parsedXML = et.parse( "Rutgers_cabinet_loading_data.xml" )
    dfcols = ['rack', 'power']
    df_xml = pd.DataFrame(columns=dfcols)

    for node in parsedXML.getroot():
        rack = node.find('Row')
        #power = node.find('Data')

        df_xml = df_xml.append(
            pd.Series([getvalueofnode(rack), getvalueofnode(power)],index=dfcols),
            ignore_index=True)

    print(df_xml)

main()
