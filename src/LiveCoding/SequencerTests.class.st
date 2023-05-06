Class {
	#name : #SequencerTests,
	#superclass : #TestCase,
	#instVars : [
		'sequencer'
	],
	#category : #'LiveCoding-Tests'
}

{ #category : #running }
SequencerTests >> setUp [

	sequencer := 8 downbeats.
	

	"Put here a common initialization logic for tests"
]

{ #category : #tests }
SequencerTests >> testArpeggiateArray [

| initial  result|
initial := #(60 61 62 63).
result := #(60 61 62 63 61 62 63 64 62 63 64 65 63 64 65 66).

self assert: (initial arp: #(0 1 2 3)) equals: result
]

{ #category : #tests }
SequencerTests >> testChangeSequencerGatesSize [

	| seq |
	seq := 16 downbeats.
	seq gatesSize: 1.
	self assert: (seq gatesSize) equals: 1
]

{ #category : #tests }
SequencerTests >> testEuclideanRhythmFromArray [

	| tresillo seq |
	tresillo := #( 3 8) euclidean.
	seq := #( 1 0 0 1 0 0 1 0) asRhythm asSeq.
	self assert: tresillo equals: seq
]

{ #category : #tests }
SequencerTests >> testFlipSequencer [

	| tresillo seq |
	tresillo := #( 3 8 ) euclidean flip.
	seq := #( 0 1 1 0 1 1 0 1 ) asRhythm asSeq .
	self assert: tresillo equals: seq
]

{ #category : #tests }
SequencerTests >> testSequencerOffset [

| seq result1 result2 |
seq := 16 downbeats.

result1 := '2222' pattern.
result2 := '1111' pattern.

self assert: (seq offset: 2) equals: result1.
self assert: (seq offset: -1) equals: result2.
]

{ #category : #tests }
SequencerTests >> testSequencerToPerformance [

sequencer to: #track.
self assert: (Performance uniqueInstance at: #track) equals: sequencer
]