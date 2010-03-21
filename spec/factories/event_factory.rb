Factory.define :event do |e|
  e.what 'TDD Workshop'
  e.description 'Hands on TDD pairing and creation of full featured application'
  e.when Date.tomorrow
  e.where 'Nosker House Lobby'
end

