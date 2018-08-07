#! /usr/bin/env racket
#lang racket/base

;Dorai Sitaram
;Last modified 2018-06-17

;Creates a sed script that converts some non-ascii Unicode characters
;to HTML entities. Used to make HTML files palatable to e-readers.

(define utf8-to-html-entity
  (lambda (ss)
    (let ((ofile "utf8htmlentity"))
      (call-with-output-file
        ofile
        (lambda (o)
          (fprintf o "sed -i -e '~%")
          (for-each
            (lambda (s)
              (for-each
                (lambda (c)
                  (fprintf o "s/~c/\\&#x~a;/g~%" c (number->string (char->integer c) 16)))
                (string->list s)))
            ss)
          (fprintf o "' $1~%"))
        #:exists 'replace)
      (file-or-directory-permissions ofile #o755))))

(utf8-to-html-entity
  (list
    "‘’“”"
    "—" "–"
    "−" "×"
    "†"
    "°′″"
    "→"
    "ĀāĒēĪīŌōŪū" "ḌḍḤḥḶḷṆṇṚṛṢṣṬṭ" "ṀṁṄṅ" "Ññ" "Śś"
    "ẖḴḵḺḻṈṉṞṟ"
    "ÄäÖöÜü" "ß"
    "ĂăĔĕĬĭŎŏŬŭ"
    "ÁáÉéÍíÓóÚú"
    "ÀàÈèÌìÒòÙù"
    "ÂâÊêÎîÔôÛû" "Çç" "Œœ" "ËëÏï"
    "ÃãÕõ"
    "ÆæÅåØø" "ÞþÐð"
    "ΓΔΘΛΞΠΣΦΨΩ" "αβγδεζηθικλμνξπρστυφξψω"
    ))
