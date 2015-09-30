ReturnValue = require 'nanocyte-component-return-value'

class ClearIfLengthGreaterThanMinElsePassthrough extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = ClearIfLengthGreaterThanMinElsePassthrough
