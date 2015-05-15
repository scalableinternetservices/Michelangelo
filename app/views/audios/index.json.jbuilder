json.array!(@audios) do |audio|
  json.extract! audio, :id, :comment, :uid
  json.url audio_url(audio, format: :json)
end
