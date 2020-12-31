<?php



class XML_Parser {
    //XML парсер
    static function parse($xmlstring) {
        $xml = xml_parser_create();
        xml_parse_into_struct($xml, $xmlstring, $parsedSim);
        xml_parser_free($xml);
        unset($dataxml);
        //print_r($parsedSim);
        $parsedSim = XML_Parser::convertXarToPar($parsedSim);
        return $parsedSim;
    }

    /* функция преобразования */
    static private function convertXarToPar(&$parsed) {
        $data = array();
        $cursor = 0;
        XML_Parser::convertExplore($data, $parsed, $cursor);
        return $data;
    }

    /* рекурсивная часть преобразователя */
    static private function convertExplore(&$data, &$parsed, &$cursor) {
        while (isset($parsed[$cursor])) {
            $v = &$parsed[$cursor ++];
            //type value analysis
            switch($v['type']) {
                case 'open':
                    $tag = $v['tag'];
                    $j = &$data[];
                    $j['tag'] = $tag;
                    $j['value'] = isset($v['value']) ? $v['value'] : '';
                    if (isset($v['attributes'])) $data += $v['attributes'];
                    XML_Parser::convertExplore($j, $parsed, $cursor);
                    break;
                case 'close':
                    return;
                case 'cdata':
                    if (empty($v['value']) || trim($v['value']) == '') break;
                    else {
                        $j = &$data[];
                        $j['value'] = trim($v['value']);
                    }
                    break;
                case 'complete':
                    $tag = $v['tag'];
                    $j = &$data[];

                    $j['tag'] = $tag;
                    $j['value'] = isset($v['value']) ? $v['value'] : '';

                    if (isset($v['attributes'])) $j += $v['attributes'];
                    break;
            }
        }
    }
}
