<?php



Class DOMXPath {

    /* Свойства */
    public DOMDocument $document ;

    /* Методы */
    public __construct ( DOMDocument $doc )
    public evaluate ( string $expression [, DOMNode $contextnode [, bool $registerNodeNS = TRUE ]] ) : mixed
    public query ( string $expression [, DOMNode $contextnode [, bool $registerNodeNS = TRUE ]] ) : DOMNodeList
    public registerNamespace ( string $prefix , string $namespaceURI ) : bool
    public registerPhpFunctions ([ mixed $restrict ] ) : void

}
