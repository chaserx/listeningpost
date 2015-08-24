puts 'creating users'
args = { email: 'me@example.com', password: 'password',
         password_confirmation: 'password' }
user = User.create(args)

puts 'creating devices'
device = Device.create(name: 'le first device', user_id: user.id)

puts 'creating webhooks'
args = { device_id: device.id, url: 'http://example.com/1',
         message_body: 'lorem ipsum'}
webhook = Webhook.create(args)
