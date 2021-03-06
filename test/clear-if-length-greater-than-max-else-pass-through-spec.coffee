ReturnValue = require 'nanocyte-component-return-value'
ClearIfLengthGreaterThanMaxElsePassThrough = require '../src/clear-if-length-greater-than-max-else-pass-through'

describe 'ClearIfLengthGreaterThanMaxElsePassThrough', ->
  beforeEach ->
    @sut = new ClearIfLengthGreaterThanMaxElsePassThrough

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when max is greater than length of message', ->
      it 'should return the message', ->
        envelope =
          message: [1,2]
          config:
            max: 3
        expect(@sut.onEnvelope envelope).to.deep.equal [1,2]

    describe 'when max is less than length of message', ->
      it 'should return an empty message', ->
        envelope =
          message: [1,2]
          config:
            max: 1
        expect(@sut.onEnvelope envelope).to.deep.equal []

    describe 'when max is the length of message', ->
      it 'should return an empty message', ->
        envelope =
          message: [1,2]
          config:
            max: 2
        expect(@sut.onEnvelope envelope).to.deep.equal []

    describe 'when message is null', ->
      it 'should return an empty message', ->
        envelope =
          message: null
          config:
            max: 1
        expect(@sut.onEnvelope envelope).to.deep.equal []

    describe 'when message is an int', ->
      it 'should return an empty message', ->
        envelope =
          message: 6
          config:
            max: 1
        expect(@sut.onEnvelope envelope).to.deep.equal []

    describe 'when max is a string int', ->
      it 'should return the message', ->
        envelope =
          message: [1,2]
          config:
            max: '3'
        expect(@sut.onEnvelope envelope).to.deep.equal [1,2]

    describe 'when max is not an int', ->
      it 'should return the message', ->
        envelope =
          message: [1,2]
          config:
            max: 'a'
        expect(@sut.onEnvelope envelope).to.deep.equal [1,2]

    describe 'when max is 0', ->
      it 'should return the message', ->
        envelope =
          message: [1,2]
          config:
            max: 0
        expect(@sut.onEnvelope envelope).to.deep.equal [1,2]

    describe 'when max is undefined', ->
      it 'should return the message', ->
        envelope =
          message: [1,2]
          config:
            max: undefined
        expect(@sut.onEnvelope envelope).to.deep.equal [1,2]
