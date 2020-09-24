#!/usr/bin/env racket

#lang racket

;created < 2018-06-17
;last modified 2020-09-23
;Dorai Sitaram

(define *special-chars*
  (string-append
    "‘’“”"
    "—"
    "–"
    "−"
    "×"
    "†"
    "°′″"
    "→"
    "ĀāĒēĪīŌōŪū"
    "ḌḍḤḥḶḷṆṇṚṛṢṣṬṭ"
    "ṀṁṄṅ"
    "Ññ"
    "Śś"
    "ẖḴḵḺḻṈṉṞṟ"
    "ÄäÖöÜü"
    "ß"
    "ĂăĔĕĬĭŎŏŬŭ"
    "ÁáÉéÍíÓóÚú"
    "ÀàÈèÌìÒòÙù"
    "ÂâÊêÎîÔôÛû"
    "Çç"
    "Œœ"
    "ËëÏï"
    "ÃãÕõ"
    "ÆæÅåØø"
    "ÞþÐð"
    "ΓΔΘΛΞΠΣΦΨΩ"
    "αβγδεζηθικλμνξπρστυφξψω"
    ))

(define (utf8-to-html-entity s)
  (call-with-output-file "utf8htmlentity"
    (lambda (o)
      (fprintf o "sed -i -e '\n")
      (for ([c s])
        (fprintf o "s/~c/\\&#x~x;/g\n" c (char->integer c)))
      (fprintf o "' $1\n"))
    #:exists 'replace))

(utf8-to-html-entity *special-chars*)

(system "chmod +x utf8htmlentity")
