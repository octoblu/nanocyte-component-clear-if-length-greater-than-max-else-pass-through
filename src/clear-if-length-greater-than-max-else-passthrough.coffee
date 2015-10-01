ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class ClearIfLengthGreaterThanMaxElsePassthrough extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope

    return [] unless _.isArray message
    return [] if config.max < _.size(message)
    return message

module.exports = ClearIfLengthGreaterThanMaxElsePassthrough
