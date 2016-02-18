ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class ClearIfLengthGreaterThanMaxElsePassThrough extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope

    return [] unless _.isArray message
    {max} = config
    return message unless max?
    max = parseInt max
    
    return message if _.isNaN max
    return message if max == 0
    return message if _.size(message) < max
    return []

module.exports = ClearIfLengthGreaterThanMaxElsePassThrough
