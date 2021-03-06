# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Category.create(name: 'Comedies')
cat2 = Category.create(name: 'Dramas')
cat3 = Category.create(name: 'Reality Shows')

breaking_bad = Video.create(title: 'Breaking Bad', description: 'A high school chemistry teacher dying of cancer teams with a former student to manufacture and sell crystal meth to secure his family\'s future.', small_cover_url: 'http://cdn0.nflximg.net/webp/7300/4177300.webp', large_cover_url: 'http://cdn4.nflximg.net/webp/7884/4177884.webp', category_id: cat1.id )
Video.create(title: 'Hemlock Grove', description: 'Secrets are just a part of daily life in the small Pennsylvania town of Hemlock Grove, where the darkest evils hide in plain sight. ', small_cover_url: 'http://cdn3.nflximg.net/webp/5303/9895303.webp', large_cover_url: 'http://cdn9.nflximg.net/images/2569/9722569.jpg', category_id: cat1.id)
Video.create(title: 'The Croods', description: 'When an earthquake obliterates their cave, an unworldly prehistoric family is forced to journey through unfamiliar terrain in search of a new home. ', small_cover_url: 'http://cdn3.nflximg.net/webp/2353/3862353.webp', large_cover_url: 'http://cdn6.nflximg.net/webp/2356/3862356.webp', category_id: cat2.id)
Video.create(title: 'House of Cards', description: 'A ruthless politician will stop at nothing to conquer Washington D.C. in this Emmy and Golden Globe winning political drama.', small_cover_url: 'http://cdn0.nflximg.net/webp/0700/9600700.webp', large_cover_url: 'http://cdn0.nflximg.net/images/5920/8005920.jpg', category_id: cat2.id)
Video.create(title: 'Witches of East End', description: 'Besides being an artist and the mother of two daughters, Joanna Beauchamp harbors an identity she hides from the world: that of a centuries-old witch.', small_cover_url: 'http://cdn7.nflximg.net/webp/2627/9882627.webp', large_cover_url: 'http://cdn6.nflximg.net/webp/2646/9882646.webp', category_id: cat3.id)

doug = User.create(email: 'doug@doug.com', password: 'password', full_name: "Doug Steinberg")

Review.create(rating: 5, body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sentiunt eligendi praeclare eram volunt nulli tenebimus molita confirmare, exorsus tractatas sollicitare alterum zenonem redeamus partiendo conflixisse angere, scripta loquuntur. Frequenter exercendi praestabiliorem. Personae exquisitaque convicia iucunda, uberius incommoda, fortibus aperta clarorum aperiam expectant rudem istis desideraturam, cognitioque adipisci. Conversa utilitate inpotenti. Ignoratione existunt chremes tradunt sollicitant doloribus, virtute optinere, durissimis quantumcumque potuimus opus. Libero aequo distinguantur, confirmat stoicis meis consumeret adiit futurove imitarentur tempore nemo cumanum, nominavi forensibus prima fecisse audiam.', user_id: doug.id, video_id: breaking_bad.id)
Review.create(rating: 3, body: 'Conversa utilitate inpotenti. Ignoratione existunt chremes tradunt sollicitant doloribus, virtute optinere, durissimis quantumcumque potuimus opus. Libero aequo distinguantur, confirmat stoicis meis consumeret adiit futurove imitarentur tempore nemo cumanum, nominavi forensibus prima fecisse audiam.', user_id: doug.id, video_id: breaking_bad.id)

bob = User.create(email: 'bob@bob.bob', password: 'password', full_name: "Bobby Brown")
jessie = User.create(email: 'jessie@hjames.com', password: 'password', full_name: "Jessie James")

Relationship.create(follower_id: doug.id, leader_id: bob.id)
Relationship.create(follower_id: doug.id, leader_id: jessie.id)