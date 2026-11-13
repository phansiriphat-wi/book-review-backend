-- สร้างโดย make-seed.mjs เมื่อ 2026-11-11T12:37:35.021Z
-- 8 หมวด รวม 400 เล่ม  ข้อมูลจาก Open Library (https://openlibrary.org)
-- รันซ้ำได้: เล่มที่มี openlibrary_key อยู่แล้วจะถูกข้าม (ไม่ทับข้อมูลที่ admin แก้ไว้)

BEGIN;

INSERT INTO books (openlibrary_key, title, author, description, category, cover_url, published_year)
VALUES
    ('OL8400950W', 'The Blade Itself', 'Joe Abercrombie', 'Logen Ninefingers, infamous barbarian, has finally run out of luck. Caught in one feud too many, he’s on the verge of becoming a dead barbarian – leaving nothing behind him but bad songs, dead friends, and a lot of happy enemies.
Nobleman Captain Jezal dan Luthar, dashing officer, and paragon of selfishness, has nothing more dangerous in mind than fleecing his friends at cards and dreaming of glory in the fencing circle. But war is brewing, and on the battlefields of the frozen North they fight by altogether bloodier rules.

Inquisitor Glokta, cripple turned torturer, would like nothing better than to see Jezal come home in a box. But then Glokta hates everyone: cutting treason out of the Union one confession at a time leaves little room for friendship. His latest trail of corpses may lead him right to the rotten heart of government, if he can stay alive long enough to follow it.

Enter the wizard, Bayaz. A bald old man with a terrible temper and a pathetic assistant, he could be the First of the Magi, he could be a spectacular fraud, but whatever he is, he''s about to make the lives of Logen, Jezal, and Glotka a whole lot more difficult.

Murderous conspiracies rise to the surface, old scores are ready to be settled, and the line between hero and villain is sharp enough to draw blood.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14543422-L.jpg', 2001),
    ('OL5738154W', 'The Hero of Ages', 'Brandon Sanderson', 'This book is not only the third book in a trilogy, but it’s Act Three of the the three-act structure for the Mistborn Trilogy—it’s the part of the story where the heroes have discovered that what they thought was the problem all along was not the true danger, and now they’re fighting for not only their own survival but that of the world they live in. The mists are killing people and staying out much longer than they should. The Ashmounts are spewing more and more choking ash into the sky, burying the crops that everyone needs to eat to live. And Ruin, the creature Vin was tricked into freeing from its prison of a millennium, is loose to wreak havoc upon the land. Life under the Lord Ruler is starting to look like paradise in comparison.

While the first book in the trilogy turned the standard fantasy story on its head, this volume (perhaps inevitably?) returns in a way to the tropes the first volume was a reaction against. Yet in this case the enemy is not a human or humanlike Dark Lord, but something more like a force of nature—entropy itself given a will and a guiding personality in the form of Ruin.

Ultimately, the book is about how the characters we have grown to love from the previous volumes—Vin, Elend, Sazed, TenSoon, Spook, Marsh, and others—find the courage and faith to fight on in the face of overwhelming odds, just as Kelsier taught them when he plotted the downfall of the Final Empire.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14658094-L.jpg', 2008),
    ('OL8369445W', 'The Lies of Locke Lamora', 'Scott Lynch', 'Best book ever', 'Fantasy', 'https://covers.openlibrary.org/b/id/6307636-L.jpg', 2001),
    ('OL17546674W', 'The Assassin’s Blade', 'Sarah J. Maas', 'Celaena Sardothien owes her reputation to Arobynn Hamel. He gave her a home at the Assassins'' Guild and taught her the skills she needed to survive.

Arobynn''s enemies stretch far and wide - from Adarlan''s rooftops and its filthy dens, to remote islands and hostile deserts. Celaena is duty-bound to hunt them down. But behind her assignments lies a dark truth that will seal her fate - and cut her heart in two forever...

Explore the dark underworld of this kick-ass heroine and find out how the legend begins in the five page-turning prequel novellas to the Throne of Glass series.', 'Fantasy', 'https://covers.openlibrary.org/b/id/7794980-L.jpg', 2014),
    ('OL2010436W', 'Wizard''s First Rule', 'Terry Goodkind', 'Richard Cypher''s father was brutally murdered a month ago, in his home with his guts ripped out of his stomach. While coping with this sudden loss, Richard saves Kahlan Amnell from four mercenaries, and with the help of Richard''s friend Zeddicus Zu''l Zorander the three flee to the midlands to stop Darken Rahl''s ever expanding empire. Secrets will be revealed, many will perish, and the legends begins.', 'Fantasy', 'https://covers.openlibrary.org/b/id/1005963-L.jpg', 1994),
    ('OL7924103W', 'The Eye of the World', 'Robert Jordan', 'The Wheel of Time turns and Ages come and go, leaving memories that become legend. Legend fades to myth, and even myth is long forgotten when the Age that gave it birth returns again. In the Third Age, an Age of Prophecy, the World and Time themselves hang in the balance. What was, what will be, and what is, may yet fall under the Shadow.', 'Fantasy', 'https://covers.openlibrary.org/b/id/980232-L.jpg', 1990),
    ('OL2577486W', 'Krew elfów', 'Andrzej Sapkowski', 'Andrzej Sapkowski, arcymistrz światowej fantasy, zaprasza do swojego Neverlandu i przedstawia uwielbianą przez czytelników i wychwalaną przez krytykę wiedźmińską sagę!

„Tako rzecze Ithlinne, elfia wieszczka i uzdrowicielka: Drżyjcie, albowiem nadchodzi Niszczyciel Narodów. Stratują waszą ziemię i sznurem ją podzielą. Miasta wasze zostaną zburzone i pozbawione mieszkańców. Nietoperz i kruk w domach waszych zamieszkają, drzewo straci liść, zgnije owoc i zgorzknieje ziarno. Zaprawdę powiadam wam, oto nadchodzi czas miecza i topora, wiek wilczej zamieci. Miasto płonie, wąskie uliczki zieją ogniem i żarem. Narasta wrzask, odgłosy zajadłej walki, murem wstrząsają głuche uderzenia taranu. Krzyk, strach. Obezwładniający, paraliżujący, duszący strach”.', 'Fantasy', 'https://covers.openlibrary.org/b/id/8457619-L.jpg', 1994),
    ('OL19351054W', 'The Poppy War', 'R. F. Kuang', 'A brilliantly imaginative talent makes her exciting debut with this epic historical military fantasy, inspired by the bloody history of China’s twentieth century and filled with treachery and magic, in the tradition of Ken Liu’s Grace of Kings and N.K. Jemisin’s Inheritance Trilogy.

When Rin aced the Keju—the Empire-wide test to find the most talented youth to learn at the Academies—it was a shock to everyone: to the test officials, who couldn’t believe a war orphan from Rooster Province could pass without cheating; to Rin’s guardians, who believed they’d finally be able to marry her off and further their criminal enterprise; and to Rin herself, who realized she was finally free of the servitude and despair that had made up her daily existence. That she got into Sinegard—the most elite military school in Nikan—was even more surprising.

But surprises aren’t always good.

Because being a dark-skinned peasant girl from the south is not an easy thing at Sinegard. Targeted from the outset by rival classmates for her color, poverty, and gender, Rin discovers she possesses a lethal, unearthly power—an aptitude for the nearly-mythical art of shamanism. Exploring the depths of her gift with the help of a seemingly insane teacher and psychoactive substances, Rin learns that gods long thought dead are very much alive—and that mastering control over those powers could mean more than just surviving school.

For while the Nikara Empire is at peace, the Federation of Mugen still lurks across a narrow sea. The militarily advanced Federation occupied Nikan for decades after the First Poppy War, and only barely lost the continent in the Second. And while most of the people are complacent to go about their lives, a few are aware that a Third Poppy War is just a spark away . . .

Rin’s shamanic powers may be the only way to save her people. But as she finds out more about the god that has chosen her, the vengeful Phoenix, she fears that winning the war may cost her humanity . . . and that it may already be too late.', 'Fantasy', 'https://covers.openlibrary.org/b/id/8463552-L.jpg', 2018),
    ('OL486967W', 'The Princess Bride', 'William Goldman', '*The Princess Bride is a timeless tale that pits country against country, good against evil, love against hate. This incredible journey and artfully rendered love story is peppered with strange beasties monstrous and gentle, memorable surprises both terrible and sublime, and such unforgettable characters as...*

**Westley**, the handsome farm boy who risks death (and much worse) for the woman he loves; **Inigo**, the Spanish swordsman who lives only to avenge his father''s death; **Fezzik**, the gentlest giant ever to have uprooted a tree with his bear hands; **Vizzini**, the evil Sicilian, with a mind so keen he''s foiled by his own perfect logic; **Prince Humperdinck**, the eviler ruler of Guilder, who has an equally insatiable thirst for war and beauteous Buttercup; **Count Rugen**, the evilest man of all, who thrives on the excruciating pain of others; **Miracle Max**, the King''s ex-Miracle Man, who can raise the dead (kind of); and, of course, **Buttercup**... the princess bride, the most perfect, beautiful woman in the history of the world!', 'Fantasy', 'https://covers.openlibrary.org/b/id/9284881-L.jpg', 1973),
    ('OL27495W', 'The Silmarillion', 'J.R.R. Tolkien, Christopher Tolkien', 'A number-one New York Times bestseller when it was originally published, The Silmarillion is the core of J.R.R. Tolkien''s imaginative writing, a work whose origins stretch back to a time long before The Hobbit.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14627042-L.jpg', 1977),
    ('OL7924208W', 'Lord of Chaos', 'Robert Jordan', 'The Wheel of Time turns and Ages come and go, leaving memories that become legend. Legend fades to myth, and even myth is long forgotten when the Age that gave it birth returns again. In the Third Age, an Age of Prophecy, the World and Time themselves hang in the balance. What was, what will be, and what is, may yet fall under the Shadow.

On the slopes of Shayol Ghul, the Myrddraal swords are forged, and the sky is not the sky of this world;

In Salidar the White Tower in exile prepares an embassy to Caemlyn, where Rand Al''Thor, the Dragon Reborn, holds the throne--and where an unexpected visitor may change the world....

In Emond''s Field, Perrin Goldeneyes, Lord of the Two Rivers, feels the pull of ta''veren to ta''veren and prepares to march...

Morgase of Caemlyn finds a most unexpected, and quite unwelcome, ally....And south lies Illian, where Sammael holds sway...

TV series update: "Sony will produce along with Red Eagle Entertainment and Radar Pictures. Rafe Judkins is attached to write and executive produce. Judkins previously worked on shows such as ABC’s “Agents of SHIELD,” the Netflix series “Hemlock Grove,” and the NBC series “Chuck.” Red Eagle partners Rick Selvage and Larry Mondragon will executive produce along with Radar’s Ted Field and Mike Weber. Darren Lemke will also executive produce, with Jordan’s widow Harriet McDougal serving as consulting producer." —*Variety*

The Wheel of Time**®**
New Spring: The Novel
#1 The Eye of the World
#2 The Great Hunt
#3 The Dragon Reborn
#4 The Shadow Rising
#5 The Fires of Heaven
#6 Lord of Chaos
#7 A Crown of Swords
#8 The Path of Daggers
#9 Winter''s Heart
#10 Crossroads of Twilight
#11 Knife of Dreams

By Robert Jordan and Brandon Sanderson
#12 The Gathering Storm
#13 Towers of Midnight
#14 A Memory of Light', 'Fantasy', 'https://covers.openlibrary.org/b/id/182398-L.jpg', 1994),
    ('OL16597059W', 'The Alloy of Law', 'Brandon Sanderson', 'Three hundred years after the events of the Mistborn trilogy, Scadrial is now on the verge of modernity, with railroads to supplement the canals, electric lighting in the streets and the homes of the wealthy, and the first steel-framed skyscrapers racing for the clouds.

Kelsier, Vin, Elend, Sazed, Spook, and the rest are now part of history—or religion. Yet even as science and technology are reaching new heights, the old magics of Allomancy and Feruchemy continue to play a role in this reborn world. Out in the frontier lands known as the Roughs, they are crucial tools for the brave men and women attempting to establish order and justice.

One such is Waxillium Ladrian, a rare Twinborn who can Push on metals with his Allomancy and use Feruchemy to become lighter or heavier at will.

After twenty years in the Roughs, Wax has been forced by family tragedy to return to the metropolis of Elendel. Now he must reluctantly put away his guns and assume the duties and dignity incumbent upon the head of a noble house. Or so he thinks, until he learns the hard way that the mansions and elegant tree-lined streets of the city can be even more dangerous than the dusty plains of the Roughs.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14658081-L.jpg', 2001),
    ('OL15358691W', 'The Way of Kings', 'Brandon Sanderson', 'Widely acclaimed for his work completing Robert Jordan’s Wheel of Time saga, Brandon Sanderson now begins a grand cycle of his own, one every bit as ambitious and immersive.

Roshar is a world of stone and storms. Uncanny tempests of incredible power sweep across the rocky terrain so frequently that they have shaped ecology and civilization alike. Animals hide in shells, trees pull in branches, and grass retracts into the soilless ground. Cities are built only where the topography offers shelter.

It has been centuries since the fall of the ten consecrated orders known as the Knights Radiant, but their Shardblades and Shardplate remain: mystical swords and suits of armor that transform ordinary men into near-invincible warriors. Men trade kingdoms for Shardblades. Wars are fought for them, and won by them.

One such war rages on a ruined landscape called the Shattered Plains. There, Kaladin, who traded his medical apprenticeship for a spear, has been reduced to slavery. In a war that makes no sense, where ten armies fight separately against a single foe, he struggles to save his men and to fathom the leaders who consider them expendable.

Brightlord Dalinar Kholin commands one of those other armies. Like his brother, the late king, he is fascinated by an ancient text called The Way of Kings. Troubled by overpowering visions of ancient times and the Knights Radiant, he has begun to doubt his own sanity.

Across the ocean, an untried young woman named Shallan seeks to train under the eminent scholar and notorious heretic Jasnah Kholin, Dalinar’s niece. Though she genuinely loves learning, Shallan’s motives are less than pure. As she plans a daring theft, her research for Jasnah hints at secrets of the Knights Radiant and the true cause of the war.

The result of more than ten years of planning, writing, and worldbuilding, The Way of Kings is but the opening movement of the Stormlight Archive, a bold masterpiece in the making.

Speak again the ancient oaths,

Life before death.
Strength before weakness.
Journey before destination.

and return to men the Shards they once bore.

The Knights Radiant must stand again.

-From Cover Flap', 'Fantasy', 'https://covers.openlibrary.org/b/id/14658316-L.jpg', 2010),
    ('OL453697W', 'Small Gods', 'Terry Pratchett, Ray Friesen', 'In the beginning was the Word.

And the Word was: "Hey, you!"

For Brutha the novice is the Chosen One. He wants peace and justice and brotherly love.

He also wants the Inquisition to stop torturing him now, please...', 'Fantasy', 'https://covers.openlibrary.org/b/id/14648232-L.jpg', 1992),
    ('OL5738147W', 'Elantris', 'Brandon Sanderson', 'Elantris: gigantic, beautiful, radiant-----filled with powerful individuals who use their magical abilities to benefit all the people of Arelon. Yet each of these godlike beings was once an ordinary person until touched by the mysterious transforming power of Shaod. Then, ten years ago, without warning, the magic failed. Elantrians became wizened, feeble, leper-like creatures, and Elantris itself dark, filthy, and crumbling. The Shaod became a curse.

Arelon''s new capital city, Kae, crouches in the shadow of Elantris, which its people do their best to ignore. Princess Sarene of Teod has come to Kae for a marriage of state with Crown Prince Raoden, hoping also to find love. Sarene learns instead that Raoden has died, and she is considered his widow.

Both Teod and Arelon are under threat from the imperial ambitions of Fjordell, a city filled with ruthless religious fanatics, and whose high priest, Hrathen, intends to convert Arelon and claim it for his emperor and his god. Now Sarene alone stands in his way.

But neither Sarene nor Hrathen suspects the truth about Prince Raoden''s disappearance. Taken by the same strange malady that felled the gods of Elantris, Raoden was secretly imprisoned within the dark city. His struggle to create a society for the wretches trapped there begins a series of events that will bring hope to Arelon, and reveal the secret of Elantris itself.

-- From the hardback inside cover', 'Fantasy', 'https://covers.openlibrary.org/b/id/14658083-L.jpg', 2005),
    ('OL15450W', 'Phantastes', 'George MacDonald', 'One of George MacDonald''s most important works, Phantastes is the story of a young man named Anotos and his long dreamlike journey in Fairy Land. It is the fairy tale of deep spiritual insight as Anotos makes his way through moments of uncertainty and peril and mistakes that can have irreversible consequences. This is also his spiritual quest that is destined to end with the supreme surrender of the self. When he finally experiences the hard-won surrender, a wave of joy overwhelms him. His intense personal introspection is honest as he is offered the full range of symbolic choices--great beauty, horrifying ugliness, irritating goblins, nurturing spirits. Each confrontation in Fairy Land allows Anotos to learn many necessary lessons. As he continues on the journey, many shadowy beings threaten his spiritual well-being and compel him to sing. The songs are irresistible to a beautiful White Lady who is freed from inside a statue by the music, and Anotos remains captivated by her for a long time. He sees the world more objectively; his trek invites a natural descent into feelings of pride and egotism. But his losses and sorrows coalesce themselves into things of grace, and these experiences help his spiritual growth.     Please Note:  This book has been reformatted to be easy to read in true text, not scanned images that can sometimes be difficult to decipher.  The Microsoft eBook has a contents page linked to the chapter headings for easy navigation. The Adobe eBook has bookmarks at chapter headings and is printable up to two full copies per year.  Both versions are text searchable.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14358814-L.jpg', 1850),
    ('OL516683W', 'Sojourn', 'R. A. Salvatore', 'Now in paperback, the third installment in the classic tales of the Legend of Drizzt. When a lone drow emerges from the Underdark into the blinding light of day, the Forgotten Realms world will be changed forever.From the Paperback edition.', 'Fantasy', 'https://covers.openlibrary.org/b/id/1005943-L.jpg', 1991),
    ('OL1922990W', 'Pawn of Prophecy', 'David Eddings', 'The first book of the Belgariad.A magnificent epic set against a history of seven thousand years of the struggles of Gods and Kings and men - of strange lands and events - of fate and a prophecy that must be fulfilled!THE BELGARIADLong ago, so the Storyteller claimed, the evil God Torak sought dominion and drove men and Gods to war. But Belgarath the Sorcerer led men to reclaim the Orb that protected men of the West. So long as it lay at Riva, the prophecy went, men would be safe.But that was only a story, and Garion did not believe in magic dooms, even though the dark man without a shadow had haunted him for years.Brought up on a quiet farm by his Aunt Pol, how could he know that the Apostate planned to wake dread Torak, or that he would be led on a quest of unparalleled magic and danger by those he loved - but did not know?For a while his dreams of innocence were safe, untroubled by knowledge of his strange heritage. For a little while...THUS BEGINS BOOK ONE OF THE BELGARIAD', 'Fantasy', 'https://covers.openlibrary.org/b/id/1000455-L.jpg', 1982),
    ('OL5734756W', 'Gardens of the Moon', 'Steven Erikson', 'The opening chapter in an epic fantasy masterpiece....Bled dry by interminable warfare, infighting and bloody confrontations with Lord Anomander Rake and his Tiste Andii, the vast, sprawling Malazan empire simmers with discontent.Even its imperial legions yearn for some respite. For Sergeant Whiskeyjack and his Bridgeburners and for Tattersail, sole surviving sorceress of the Second Legion, the aftermath of the siege of Pale should have been a time to mourn the dead. But Darujhistan, last of the Free Cities of Genabackis, still holds out - and Empress Lasseen''s ambition knows no bounds. However, it seems the empire is not alone in this great game. Sinister forces gather as the gods themselves prepare to play their hand... Conceived and written on an epic scale, Gardens of the Moon is a breathtaking achievement - a novel in which grand design, a dark and complex mythology, wild and wayward magic and a host of enduring characters combine with thrilling, powerful storytelling to resounding effect. Acclaimed by writers, critics and readers alike, here is the opening chapter in what has been hailed a landmark of epic fantasy: the awesome ''The Malazan Book of the Fallen''.', 'Fantasy', 'https://covers.openlibrary.org/b/id/374277-L.jpg', 1999),
    ('OL7924199W', 'The Shadow Rising', 'Robert Jordan', 'The Wheel of Time turns and Ages come and go, leaving memories that become legend. Legend fades to myth, and even myth is long forgotten when the Age that gave it birth returns again. In the Third Age, an Age of Prophecy, the World and Time themselves hang in the balance. What was, what will be, and what is, may yet fall under the Shadow.
The seals of Shayol Ghul are weak now, and the Dark One reaches out. The Shadow is rising to cover humankind.
In Tar Valon, Min sees portents of hideous doom. Will the White Tower itself be broken?
In the Two Rivers, the Whitecloaks ride in pursuit of a man with golden eyes, and in pursuit of the Dragon Reborn.
In Cantorin, among the Sea Folk, High Lady Suroth plans the return of the Seanchan armies to the mainland.
In the Stone of Tear, the Lord Dragon considers his next move. It will be something no one expects, not the Black Ajah, not Tairen nobles, not Aes Sedai, not Egwene or Elayne or Nynaeve.
Against the Shadow rising stands the Dragon Reborn...', 'Fantasy', 'https://covers.openlibrary.org/b/id/603240-L.jpg', 1992),
    ('OL34774028W', 'Powerless', 'Lauren Roberts', 'Only the extraordinary belong in the kingdom of Ilya—the exceptional, the empowered, the Elites.

The powers these Elites have possessed for decades were graciously gifted to them by the Plague, though not all were fortunate enough to both survive the sickness and reap the reward. Those born Ordinary are just that—ordinary. And when the king decreed that all Ordinaries be banished in order to preserve his Elite society, lacking an ability suddenly became a crime—making Paedyn Gray a felon by fate and a thief by necessity.

Surviving in the slums as an Ordinary is no simple task, and Paedyn knows this better than most. Having been trained by her father to be overly observant since she was a child, Paedyn poses as a Psychic in the crowded city, blending in with the Elites as best she can in order to stay alive and out of trouble. Easier said than done.

When Paeydn unsuspectingly saves one of Ilyas princes, she finds herself thrown into the Purging Trials. The brutal competition exists to showcase the Elites’ powers—the very thing Paedyn lacks. If the Trials and the opponents within them don’t kill her, the prince she’s fighting feelings for certainly will if he discovers what she is—completely Ordinary. Powerless pdf', 'Fantasy', 'https://covers.openlibrary.org/b/id/14567864-L.jpg', 2023),
    ('OL14871979W', 'The Shadow of the Torturer', 'Gene Wolfe', 'The Shadow of the Torturer is the first volume in the four-volume series, The Book of the New Sun. It is the tale of young Severian, an apprentice in the Guild of Torturers on the world called Urth, exiled for committing the ultimate sin of his profession -- showing mercy toward his victim -- and follows subsequent journey out of his home city of Nessus.', 'Fantasy', 'https://covers.openlibrary.org/b/id/7029509-L.jpg', 1980),
    ('OL2577472W', 'Miecz przeznaczenia', 'Andrzej Sapkowski', 'Wiedźmiński kodeks stawia tę sprawę w sposób jednoznaczny: wiedźminowi smoka zabijać się nie godzi.
To gatunek zagrożony wymarciem. Aczkolwiek w powszechnej opinii to gad najbardziej wredny. Na oszluzgi, widłogony i latawce kodeks polować przyzwala.

Ale na smoki – nie.

Wiedźmin Geralt przyłącza się jednak do zorganizowanej przez króla Niedamira wyprawy na smoka, który skrył się w jaskiniach Gór Pustulskich. Na swej drodze spotyka trubadura Jaskra oraz – jakżeby inaczej – czarodziejkę Yennefer. Wśród zaproszonych przez króla co sławniejszych smokobójców jest Eyck z Denesle, rycerz bez skazy i zmazy, Rębacze z Cinfrid i szóstka krasnoludów pod komendą Yarpena Zigrina. Motywacje są różne, ale cel jeden.
Smok nie ma szans.', 'Fantasy', 'https://covers.openlibrary.org/b/id/6757701-L.jpg', 1992),
    ('OL1923013W', 'Enchanters'' End Game (The Belgariad)', 'David Eddings, David Eddings', 'The final book of the Belgariad.A magnificent epic set against a history of seven thousand years of the struggles of Gods and Kings and men - of strange lands and events - of fate and a prophecy that must be fulfilled!THE BELGARIADThe quest was over. The Orb of Aldur was restored. And once again, with the crowning of Garion, there was a descendant of Riva Iron-grip to rule as Overlord of the West.But the Prophecy was unfulfilled. In the east, the evil God Torak was about to awaken and seek dominion. Somehow, Garion had to face the God, to kill or be killed. On the outcome of that dread duel rested the destiny of the world. Now, accompanied by his grandfather, the ancient sorcerer Belgarath, Garion headed towards the City of Endless Night, where Torak awaited him.To the south, the Princess Ce''Nedra led the armies of the West in a desperate effort to divert the forces of Torak''s followers from the man she loved.The Prophecy drove Garion on. But it gave no answer to the question that haunted him: How does a man kill an immortal God?THUS ENDS THE EPIC STORY OF THE BELGARIAD', 'Fantasy', 'https://covers.openlibrary.org/b/id/209046-L.jpg', 1984),
    ('OL7924172W', 'The Fires of Heaven', 'Robert Jordan', 'The bonds and wards that hold the Great Lord of the Dark are slowly failing, but still his fragile prison holds. The Forsaken, immortal servants of the shadow, weave their snares and tighten their grip upon the realms of men, sure in the knowledge that their master will soon break free...
Rand al'' Thor, the Dragon Reborn, knows that he must strike at the Enemy, but his forces are divided by treachery and by ambition. Even the Aes Sedai, ancient guardians of the Light, are riven by civil war. Betrayed by his allies, pursued by his enemies and beset by the madness that comes to the male wielders of the One Power, Rand rides out to meet the foe.', 'Fantasy', 'https://covers.openlibrary.org/b/id/603821-L.jpg', 1993),
    ('OL2707209W', 'Ship of Magic', 'Robin Hobb', 'Bingtown is a hub of exotic trade and home to a merchant nobility famed for its liveships—rare vessels carved from wizardwood, which ripens magically into sentient awareness. Now the fortunes of one of Bingtown’s oldest families rest on the newly awakened liveship Vivacia. 
 
For Althea Vestrit, the ship is her rightful legacy. For Althea’s young nephew, wrenched from his religious studies and forced to serve aboard the ship, the Vivacia is a life sentence. But the fate of the ship—and the Vestrits—may ultimately lie in the hands of an outsider: the ruthless buccaneer captain Kennit, who plans to seize power over the Pirate Isles by capturing a liveship and bending it to his will.', 'Fantasy', 'https://covers.openlibrary.org/b/id/372583-L.jpg', 1998),
    ('OL81600W', 'The Dark Tower', 'Stephen King', '"Roland''s ka-tet remains intact, though scattered over wheres and whens. Susannah-Mia has been carried from the Dixie Pig (in the summer of 1999) to a birthing room - really a chamber of horrors - in Thunderclap''s Fedic; Jake and Father Callahan, with Oy between them, have entered the restaurant on Lex and Sixty-first with weapons drawn, little knowing how numerous and noxious are their foes. Roland and Eddie are with John Cullum in Maine, in 1977, looking for the site on Turtleback Lane where "walk-ins" have been often seen. They want desperately to get back to the others, to Susannah especially, and yet they have come to realize that the world they need to escape is the only one that matters." "Thus the book opens, like a door to the uttermost reaches of Stephen King''s imagination. You''ve come this far. Come a little farther. Come all the way. The sound you hear may be the slamming of the door behind you. Welcome to The Dark Tower."--BOOK JACKET.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14656148-L.jpg', 1990),
    ('OL15015332W', 'The Way of Shadows', 'Brent Weeks', 'For Durzo Blint, assassination is an art. And he is the city''s most accomplished artist, his talents required from alleyway to courtly boudoir.
For Azoth, survival is precarious. Something you never take for granted. As a guild rat, he''s grown up in the slums, and learned the hard way to judge people quickly - and to take risks. Risks like apprenticing himself to Durzo Blint.
But to be accepted, Azoth must turn his back on his old life and embrace a new identity and name. As Kylar Stern, he must learn to navigate the assassins'' world of dangerous politics and strange magics - and cultivate a flair for death.', 'Fantasy', 'https://covers.openlibrary.org/b/id/6306862-L.jpg', 2008),
    ('OL81594W', 'Wolves of the Calla', 'Stephen King', '[The Dark Tower][1] V

After escaping the perilous wreckage of Blaine the insane Mono and eluding the evil clutches of the vindictive sorcerer Randall Flagg, Roland and his ka-tet find themselves back on the southeasterly path of the Beam. Here, in the borderlands that lie between Mid-World and End-World, Roland and his friends are approached by a frightened band of representatives from the nearby town of Calla Bryn Sturgis. In less than a month, the Calla will be attacked by the Wolves--those masked riders that gallop out of Thunderclap once a generation to steal the town''s children. The Calla folken need the kind of help that only gunslingers can give, and if the tet agrees to help, the town''s priest--Father Callahan, once of ''Salem''s Lot, Maine--promises to give them Black Thirteen, the most potent and treacherous of Maerlyn''s magic balls. He used it to enter Mid-World, and now it sleeps fitfully beneath the floorboards of his church. Meanwhile, in the New York of 1977, the Sombra Corporation plots to destroy the lot at Second Avenue and Forty-Sixth Street. How can Roland and his friends both save the rose and fight the Wolves? Only by using the magic of Black Thirteen, but how can anyone trust this sinister and treacherous object which is, in actuality, the eye of the Crimson King himself? Time is running out on all levels of the Tower, but unless our ka-tet can defeat the minions of Thunderclap both in our world and in Mid-World, they will never reach that great lynchpin of the time/space continuum which, even now, begins to totter . . .
([source][2])', 'Fantasy', 'https://covers.openlibrary.org/b/id/14652470-L.jpg', 1997),
    ('OL8400949W', 'Best served cold', 'Joe Abercrombie', 'War may be hell, but for Monza Murcatto, a solider of considerable fortune; it''s a damn good way of making money too.  Her victories have made her popular - a shade too popular for her employer''s taste. Betrayed and left for dead, Murcatto''s reward is a broken body and a burning hunger for vengeance. Whatever the cost, seven men must die.

Duke Orso imagines that he can become king by ending the civil wars that have devastated Styria, but he errs by trying to kill his overly popular general, mercenary Monza Murcatto. Recovering from her massive injuries and mourning her murdered brother, Monza vows vengeance on Orso and half a dozen of his accomplices.

"Joe Abercrombie takes the grand tradition of high fantasy literature and drags it down into the gutter, in the best possible way." --- Time
"Abercrombie is both fiendishly inventive and solidly convincing, especially when sprinkling his appallingly vivid combat scenes with humor so dark that it''s almost ultraviolet." --- Publishers Weekly
"A satisfyingly brutal fantasy quest. BEST SERVED COLD? Modern fantasy doesn''t get much hotter than this." --- Dave Bradley, SFX
"Abercrombie has written the finest epic fantasy trilogy in recent memory. He''s one writer that no one should miss." --- Junot Diaz on The First Law Trilogy', 'Fantasy', 'https://covers.openlibrary.org/b/id/14543410-L.jpg', 2009),
    ('OL19960448W', 'The Emperor''s Soul', 'Brandon Sanderson', 'WINNER, 2013 Hugo Award for Best Novella! Nominee, 2013 World Fantasy Award for Novella! From #1 New York Times bestselling author Brandon Sanderson, The Emperor''s Soul showcases a fascinating magic system as the clock ticks down for a condemned criminal. When Shai is caught replacing the Moon Scepter with her nearly flawless forgery, she must bargain for her life. An assassin has left the Emperor Ashravan without consciousness, a circumstance concealed only by the death of his wife. If the emperor does not emerge after his hundred-day mourning period, the rule of the Heritage Faction will be forfeit and the empire will fall into chaos. Shai is given an impossible task: to create—to Forge—a new soul for the emperor in less than one hundred days. But her soul-Forgery is considered an abomination by her captors. She is confined to a tiny, dirty chamber, guarded by a man who hates her, spied upon by politicians, and trapped behind a door sealed in her own blood. Shai''s only possible ally is the emperor''s most loyal councillor, Gaotona, who struggles to understand her true talent. Time is running out for Shai. Forging, while deducing the motivations of her captors, she needs a perfect plan to escape…', 'Fantasy', 'https://covers.openlibrary.org/b/id/14658408-L.jpg', 2012),
    ('OL2577482W', 'Ostatnie Życzenie', 'Andrzej Sapkowski', 'Pozycja, która przedstawia początki historii słynnego Geralta z Rivii. Sięgnij po tę lekturę i zanurz się w świecie, pełnym niebezpiecznych stworzeń, nierzadko napadających na ludzkie osady.

"Ostatnie życzenie" to jeden ze zbiorów opowiadań z cyklu wiedźmińskiego, który zdobył ogromną popularność nie tylko w Polsce, ale i na całym świecie, między innymi za sprawą gry komputerowej, a następnie dzięki serialowi, wyprodukowanemu przez platformę Netflix.

Główny bohater, Geralt z Rivii, jest wiedźminem, czyli osobą, która w zamian za wynagrodzenie, pozbywa się rozlicznych potworów. Działa według ściśle określonego systemu moralnego, dzieląc wszystko na to, co dobre i na to, co złe, nie uznając natomiast niczego pośrodku. Nie zabija, jeśli nie musi tego robić. Woli stawiać na uroki, które czasem też mogą rozwiązać problem. W trakcie swoich przygód poznaje piękną czarodziejkę, Yennefer, która wzbudza w nim fascynację. Jakie zlecenia czekają na niego w najbliższej przyszłości?', 'Fantasy', 'https://covers.openlibrary.org/b/id/7360819-L.jpg', 1993),
    ('OL20650912W', 'House of Earth and Blood', 'Sarah J. Maas', 'Bound by blood.
Tempted by desire.
Unleashed by destiny.

Bryce Quinlan had the perfect life—working hard all day and partying all night—until a demon murdered her closest friends, leaving her bereft, wounded, and alone. When the accused is behind bars but the crimes start up again, Bryce finds herself at the heart of the investigation. She’ll do whatever it takes to avenge their deaths.

Hunt Athalar is a notorious Fallen angel, now enslaved to the Archangels he once attempted to overthrow. His brutal skills and incredible strength have been set to one purpose—to assassinate his boss’s enemies, no questions asked. But with a demon wreaking havoc in the city, he’s offered an irresistible deal: help Bryce find the murderer, and his freedom will be within reach.

As Bryce and Hunt dig deep into Crescent City’s underbelly, they discover a dark power that threatens everything and everyone they hold dear, and they find, in each other, a blazing passion—one that could set them both free, if they’d only let it.

With unforgettable characters, sizzling romance, and page-turning suspense, this richly inventive new fantasy series by #1 New York Times bestselling author Sarah J. Maas delves into the heartache of loss, the price of freedom—and the power of love.', 'Fantasy', 'https://covers.openlibrary.org/b/id/9289603-L.jpg', 2019),
    ('OL261586W', 'Exile', 'R. A. Salvatore', 'As I became a creature of the empty tunnels, survival became easier and more difficult all at once. I gained in the physical skills and experience necessary to live on. I could defeat almost anything that wandered into my chosen domain. It did not take me long, however, to discover one nemesis that I could neither defeat nor flee. It followed me wherever I went--indeed, the farther I ran, the more it closed in around me. My enemy was solitude, the interminable, incessant silence of hushed corridors.--Drizzt Do''UrdenFrom the Paperback edition.', 'Fantasy', 'https://covers.openlibrary.org/b/id/547296-L.jpg', 1990),
    ('OL7924135W', 'The Great Hunt (The Wheel of Time Book 2)', 'Robert Jordan', 'Now in development for TV!

Since its debut in 1990, The Wheel of Time® by Robert Jordan has captivated millions of readers around the globe with its scope, originality, and compelling characters.

The Wheel of Time turns and Ages come and go, leaving memories that become legend. Legend fades to myth, and even myth is long forgotten when the Age that gave it birth returns again. In the Third Age, an Age of Prophecy, the World and Time themselves hang in the balance. What was, what will be, and what is, may yet fall under the Shadow.

For centuries, gleemen have told the tales of The Great Hunt of the Horn. So many tales about each of th Hunters, and so many Hunters to tell of...Now the Horn itself is found: the Horn of Valere long thought only legend, the Horn which will raise the dead heroes of the ages. And it is stolen.

TV series update: "Sony will produce along with Red Eagle Entertainment and Radar Pictures. Rafe Judkins is attached to write and executive produce. Judkins previously worked on shows such as ABC’s “Agents of SHIELD,” the Netflix series “Hemlock Grove,” and the NBC series “Chuck.” Red Eagle partners Rick Selvage and Larry Mondragon will executive produce along with Radar’s Ted Field and Mike Weber. Darren Lemke will also executive produce, with Jordan’s widow Harriet McDougal serving as consulting producer." —*Variety*

The Wheel of Time**®**
New Spring: The Novel
#1 The Eye of the World
#2 The Great Hunt
#3 The Dragon Reborn
#4 The Shadow Rising
#5 The Fires of Heaven
#6 Lord of Chaos
#7 A Crown of Swords
#8 The Path of Daggers
#9 Winter''s Heart
#10 Crossroads of Twilight
#11 Knife of Dreams

By Robert Jordan and Brandon Sanderson
#12 The Gathering Storm
#13 Towers of Midnight
#14 A Memory of Light', 'Fantasy', 'https://covers.openlibrary.org/b/id/182352-L.jpg', 1990),
    ('OL27310398W', 'Haunting Adeline', 'H. D. Carlton', '**The Manipulator**

I can manipulate the emotions of anyone who lets me.

I will make you hurt, make you cry, make you laugh and sigh.

But my words don''t affect him. Especially not when I plead for him to leave.

He''s always there, watching and waiting.

And I can never look away.

Not when I want him to come closer.

**The Shadow**

I didn''t mean to fall in love.

But now that I have, I can''t stay away.

I''m mesmerized by her smile, by her eyes, and the way she moves.

The way she undresses...

I''ll keep watching and waiting. Until I can make her mine.

And once she is, I''ll never let her go.

Not even when she begs me to.', 'Fantasy', 'https://covers.openlibrary.org/b/id/12992962-L.jpg', 2021),
    ('OL41943074W', 'Onyx Storm', 'Rebecca Yarros', 'After nearly eighteen months at Basgiath War College, Violet Sorrengail knows there’s no more time for lessons. No more time for uncertainty. Because the battle has truly begun, and with enemies closing in from outside their walls and within their ranks, it’s impossible to know who to trust.

Now Violet must journey beyond the failing Aretian wards to seek allies from unfamiliar lands to stand with Navarre. The trip will test every bit of her wit, luck, and strength, but she will do anything to save what she loves—her dragons, her family, her home, and him.

Even if it means keeping a secret so big, it could destroy everything. They need an army. They need power. They need magic. And they need the one thing only Violet can find—the truth. But a storm is coming...and not everyone can survive its wrath.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14826089-L.jpg', 2025),
    ('OL2707183W', 'Assassin''s Apprentice', 'Robin Hobb', 'Young Fitz is the bastard son of the noble Prince Chivalry, raised in the shadow of the royal court by his father''s gruff stableman.  He is treated like an outcast by all the royalty except the devious King Shrewd, who has him secretly tutored in the arts of the assassin.  For in Fitz''s blood runs the magic Skill--and the darker knowledge of a child raised with the stable hounds and rejected by his family.  As barbarous raiders ravage the coasts, Fitz is growing to manhood.  Soon he will face his first dangerous, soul-shattering mission.  And though some regard him as a threat to the throne, he may just be the key to the survival of the kingdom.From the Paperback edition.', 'Fantasy', 'https://covers.openlibrary.org/b/id/4915230-L.jpg', 1995),
    ('OL24706481W', 'Once Upon a Broken Heart', 'Stephanie Garber', '***How far would you go for happily ever after?***

For as long as she can remember, Evangeline Fox has believed in true love and happy endings... until she learns that the love of her life will marry another.

Desperate to stop the wedding and to heal her wounded heart, Evangeline strikes a deal with the charismatic but wicked Prince of Hearts. In exchange for his help, he asks for three kisses, to be given at the time and place of his choosing.

But after Evangeline''s first promised kiss, she learns that bargaining with an immortal is a dangerous game―and that the Prince of Hearts wants far more from her than she''d pledged. He has plans for Evangeline, plans that will either end in the greatest happily ever after or the most exquisite tragedy...', 'Fantasy', 'https://covers.openlibrary.org/b/id/11427092-L.jpg', 2021),
    ('OL15056584W', 'The ones who walk away from Omelas', 'Ursula K. Le Guin', 'Some inhabitants of a peaceful kingdom cannot tolerate the act of cruelty that underlies its happiness.', 'Fantasy', 'https://covers.openlibrary.org/b/id/3993167-L.jpg', 1973),
    ('OL516728W', 'The Crystal Shard', 'R. A. Salvatore', 'Isolated in the barren stretches of Icewind Dale the villages of Ten-Towns come under attack by a tribe of barbarians. In the midst of battle a young barbarian named Wulfgar ends up owing five years of his life to a grizzled dwarf. With the help of Drizzt, a renegade dark elf, the dwarf strives to mold the barbarian into a warrior with both brawn and brains.

Meanwhile, there is no peace for the people of Ten-Towns. The fractioned tribes of barbarians continue to pose a threat, and Wulfgar may be the only person who can avert a deadly battle. But an even more dire menace appears when a weak-willed apprentice mage stumbles upon a magical crystal shard. The evil shard directs the hapless mage onto a course of destruction that all of Icewind Dale may be powerless to stop.

*from the paperback*', 'Fantasy', 'https://covers.openlibrary.org/b/id/1048109-L.jpg', 1988),
    ('OL34028551W', 'Iron Flame', 'Rebecca Yarros', '“The first year is when some of us lose our lives. The second year is when the rest of us lose our humanity.” —Xaden Riorson

Everyone expected Violet Sorrengail to die during her first year at Basgiath War College—Violet included. But Threshing was only the first impossible test meant to weed out the weak-willed, the unworthy, and the unlucky.

Now the real training begins, and Violet’s already wondering how she’ll get through. It’s not just that it’s grueling and maliciously brutal, or even that it’s designed to stretch the riders’ capacity for pain beyond endurance. It’s the new vice commandant, who’s made it his personal mission to teach Violet exactly how powerless she is–unless she betrays the man she loves.

Although Violet’s body might be weaker and frailer than everyone else’s, she still has her wits—and a will of iron. And leadership is forgetting the most important lesson Basgiath has taught her: Dragon riders make their own rules.

But a determination to survive won’t be enough this year.

Because Violet knows the real secret hidden for centuries at Basgiath War College—and nothing, not even dragon fire, may be enough to save them in the end.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14405746-L.jpg', 2023),
    ('OL80870W', 'A Spell for Chameleon', 'Piers Anthony', 'Xanth was the enchanted land where magic ruled - where every citizen had a special spell only he could cast. It was a land of centaurs, dragons and basiliks.But poor Bink alone had no magic. And unless he got some - and fast - he would be exiled.

The Good Magician Humfrey was convined that Bink did indeed have magic, magic as powerful as any possessed by the King or Good Magician Humfrey himself. But no one could fathom the nature of Bink''s very special magic. Bink was in despair. This was worse than having no magic at all...and he would still be exiled.', 'Fantasy', 'https://covers.openlibrary.org/b/id/6453925-L.jpg', 1977),
    ('OL80857W', 'On a pale horse', 'Piers Anthony', 'When Zane shot Death, he learned, too late, that he would have to assume his place, speeding over the world riding his pale horse, and ending the lives of others. Sooner than he would have thought possible, Zane found himself being drawn to Satan''s plot. Already the Prince of Evil was forging a trap in which Zane must act to destroy Luna, the woman he loved...unless he could discover the only way out....
The first novel of the INCARNATIONS OF IMMORTALITY series.', 'Fantasy', 'https://covers.openlibrary.org/b/id/10093473-L.jpg', 1983),
    ('OL27482W', 'The Hobbit', 'J.R.R. Tolkien', 'The Hobbit is a tale of high adventure, undertaken by a company of dwarves in search of dragon-guarded gold. A reluctant partner in this perilous quest is Bilbo Baggins, a comfort-loving unambitious hobbit, who surprises even himself by his resourcefulness and skill as a burglar.

Encounters with trolls, goblins, dwarves, elves, and giant spiders, conversations with the dragon, Smaug, and a rather unwilling presence at the Battle of Five Armies are just some of the adventures that befall Bilbo.

Bilbo Baggins has taken his place among the ranks of the immortals of children’s fiction. Written by Professor Tolkien for his children, The Hobbit met with instant critical acclaim when published.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14627509-L.jpg', 1937),
    ('OL453658W', 'Mort', 'Terry Pratchett', 'Death takes on an apprentice who''s an individual thinker.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14648805-L.jpg', 1987),
    ('OL5714297W', 'Midnight', 'Erin Hunter', 'Darkness, air, water, and sky will come together... and shake the forest to its roots. 

The wild cat Clans have lived in peace and harmony for many moons - but now, strange messages from their warrior ancestors speak of terrifying new prophecies and a mysterious danger. 

All the signs point to young warrior Brambleclaw as the cat with the fate of the forest in his paws. But who are the other cats mentioned in the prophecy? All he knows for sure is that the strength and courage of the greatest warriors will be needed now, as the quest to save the Clans begins.', 'Fantasy', 'https://covers.openlibrary.org/b/id/9392106-L.jpg', 2005),
    ('OL257939W', 'A Clash of Kings', 'George R. R. Martin', 'In this thrilling sequel to *A Game of Thrones*, George R. R. Martin has created a work of unsurpassed vision, power, and imagination. *A Clash of Kings* transports us to a world of revelry and revenge, wizardry and warfare unlike any we have ever experienced.

***A Clash of Kings***

A comet the color of blood and flame cuts across the sky. Two great leaders—Lord Eddard Stark and Robert Baratheon—who hold sway over an age of enforced peace are dead, victims of royal treachery. Now, from the ancient citadel of Dragonstone to the forbidding shores of Winterfell, chaos reigns. Six factions struggle for control of a divided land and the Iron Throne of the Seven Kingdoms, preparing to stake their claims through tempest, turmoil, and war.

It is a tale in which brother plots against brother and the dead rise to walk in the night. Here a princess masquerades as an orphan boy; a knight of the mind prepares a poison for a treacherous sorceress; and wild men descend from the Mountains of the Moon to ravage the countryside. Against a backdrop of incest and fratricide, alchemy and murder, victory may go to the men and women possessed of the coldest steel...and the coldest hearts. For when kings clash, the whole land trembles.

Preceded by: [***A Game of Thrones***][1]
Followed by: [***A Storm of Swords***][2]

([Source][3])', 'Fantasy', 'https://covers.openlibrary.org/b/id/8231751-L.jpg', 1998),
    ('OL17850410W', 'The Cruel Prince', 'Holly Black', '**GUARD YOUR MORTAL HEART.**

JUDE WAS SEVEN WHEN HER PARENTS were murdered and she and her two sisters were stolen away to live in the treacherous High Court of Faerie. Ten years later, Jude wants nothing more than to belong there, despite her mortality. But many of the fey despise humans. Especially Prince Cardan, the youngest and wickedest son of the High King.

To win a place at the Court, she must defy him--and face the consequences.

As Jude becomes more deeply embroiled in palace intrigues and deceptions, she discovers her own capacity for tricker and bloodshed. But as betrayal threatens to drown the Courts of Faerie in violence, Jude will need to risk her life in a dangerous alliance to save her sisters, and Faerie itself.

From #1 *New York Times* bestselling author Holly Black comes the first book in a stunning new trilogy filled with twists and enchantment, as one girl learns the meaning of true power when she finds herself caught in a web of royal faerie intrigue.

This description comes from the publisher. *The Cruel Prince* is the first book of the Folk of the Air trilogy.', 'Fantasy', 'https://covers.openlibrary.org/b/id/8361789-L.jpg', 2018),
    ('OL17770504W', 'Arcanum Unbounded', 'Brandon Sanderson', 'The first story collection by *New York Times* bestselling author Brandon Sanderson

Brandon Sanderson creates worlds, and those worlds are linked. His universe spans the Stormlight Archive, the Mistborn series, the tales of Elantris, and others, comprising a unique constellation of vividly imagined realms known as the Cosmere.

Now for the first time anywhere, stories representing each of these planets, and their fully realized and distinct magic systems, have been collected in a single spectacular volume. *Arcanum Unbounded: The Cosmere Collection* brings together tales spanning the known limits of Sanderson''s universe--including the never-before-published *Edgedancer*, a thrilling new novella of the Stormlight Archive--along with charts, illustrations, notes...and secrets.

*The Cosmere Collection* encompasses six worlds in all, explored across nine astonishing works of short fiction: **Sel** ("The Hope of Elantris" and *The Emperor''s Soul*); **Scadrial** ("The Eleventh Metal," "Allomancer Jak and the Pits of Eltania, Episodes Twenty-eight Through Thirty," and *Mistborn: Secret History*); **Taldain** ("White Sand"); **Threnody** (Shadows for Silence in the Forests of Hell"); **First of the Sun** ("Sixth of the Dusk"); and **Roshar** (*Edgedancer*).

These exciting tales will catapult you onto an unprecedented journey across a cosmos only Brandon Sanderson could have envisioned. *Arcanum Unbounded: The Cosmere Collection* is an indispensable volume no Sanderson fan can do without.

This description comes from the publisher.', 'Fantasy', 'https://covers.openlibrary.org/b/id/14658368-L.jpg', 2016),
    ('OL17610507W', 'Death''s End (The Three-Body Problem Series Book 3)', '刘慈欣', 'Soon to be a Netflix Original Series!

“The War of the Worlds for the 21st century… packed with a sense of wonder.” – Wall Street Journal

The New York Times bestselling conclusion to a tour de force near-future adventure trilogy from China''s bestselling and beloved science fiction writer.

With The Three-Body Problem, English-speaking readers got their first chance to read China''s most beloved science fiction author, Cixin Liu. The Three-Body Problem was released to great acclaim including coverage in The New York Times and The Wall Street Journal and reading list picks by Barack Obama and Mark Zuckerberg. It was also won the Hugo and Nebula Awards, making it the first translated novel to win a major SF award.

Now this epic trilogy concludes with Death''s End. Half a century after the Doomsday Battle, the uneasy balance of Dark Forest Deterrence keeps the Trisolaran invaders at bay. Earth enjoys unprecedented prosperity due to the infusion of Trisolaran knowledge. With human science advancing daily and the Trisolarans adopting Earth culture, it seems that the two civilizations will soon be able to co-exist peacefully as equals without the terrible threat of mutually assured annihilation. But the peace has also made humanity complacent.

Cheng Xin, an aerospace engineer from the early twenty-first century, awakens from hibernation in this new age. She brings with her knowledge of a long-forgotten program dating from the beginning of the Trisolar Crisis, and her very presence may upset the delicate balance between two worlds. Will humanity reach for the stars or die in its cradle?', 'Science Fiction', 'https://covers.openlibrary.org/b/id/7893958-L.jpg', 2010),
    ('OL46401W', 'The Caves of Steel', 'Isaac Asimov', 'In the future you will walk down the crowded streets of New York City not knowing if the bodies brushing past you are humans or androids. With tensions already mounting between humans and robots, the murder of a Spacer must be handled in a politically-correct fashion so Detective Elijah Baley is assigned a robot partner.

Baley and R. Daneel Olivaw become like Sir Arthur Conan Doyle s Sherlock Holmes and Dr. Watson, Law & Order s Detectives Lennie Brisco and Ed Green, and Training Day s Detective Alonzo Harris and Officer Jake Hoyt disparate partners who must work together to solve a crime. The only problem is, Baley doesn''t trust anyone not his boss, not his wife, and certainly not his robot partner.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/13790511-L.jpg', 1953),
    ('OL7967812W', 'Roadside Picnic', 'Аркадий Стругацкий, Борис Стругацкий, Arkady and Boris Strugatsky', '[Comment by Hari Kunru in The Guardian][1]:

> Soviet-era Russian science fiction deserves a wider audience in English. The Strugatsky brothers collaborated on numerous novels and stories, the best known of which is this, partly because it was filmed by Andrei Tarkovsky as Stalker, in 1977. The novel takes place 10 years after a mysterious alien visitation, which seems to have no rational explanation. No one saw the visitors. Their presence caused disease and blindness in the areas where they landed. Now, in the six "Zones", the laws of physics (and, seemingly, of reality) are disturbed by anomalies, and littered with inexplicable, deadly wreckage. Only a few brave "stalkers" risk their lives to enter the zones to gather alien artefacts for sale. Some of these artefacts offer the promise of extraordinary powers. Unlike Tarkovsky''s film, which concentrates on the hallucinatory, vacated landscape of the zones, the novels portray a society adapting to an inexplicable, terrifying event, an eruption of the unknown. Though written in 1971 and published in English in 1977, the novel was heavily bowdlerised by Soviet censors, and an authoritative text wasn''t available in Russian until 2000. It''s a book with an extraordinary atmosphere – and a demonstration of how science fiction, by using a single bold central metaphor, can open up the possibilities of the novel.

Original Title: Пикник на обочине', 'Science Fiction', 'https://covers.openlibrary.org/b/id/6752719-L.jpg', 1978),
    ('OL46390W', 'The Foundation Trilogy', 'Isaac Asimov', '- Foundation
 - Foundation and Empire
 - Second Foundation

Isaac Asimov''s Foundation novels are some of the great masterworks of science fiction. Unsurpassed for their unique blend of nonstop action, daring ideas, and extensive world-building, they chronicle the struggle of a courageous group of men and women working to preserve humanity’s light against an inexorable tide of darkness and violence.

Led by its founding father, the great psychohistorian Hari Seldon, and taking advantage of its superior science and technology, the Foundation has survived the greed and barbarism of its neighboring warrior-planets. Yet now it must face the Empire—still the mightiest force in the Galaxy even in its death throes. When an ambitious general determined to restore the Empire’s glory turns the vast imperial fleet toward the Foundation, the only hope for the small planet of scholars and scientists lies in the prophecies of Hari Seldon.

But not even Hari Seldon could have predicted the birth of the extraordinary creature called The Mule, a mutant intelligence with a power greater than a dozen battle fleets… a power that can turn the strongest-willed human into an obedient slave.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/6502517-L.jpg', 1950),
    ('OL1963251W', 'The Fall of Hyperion', 'Dan Simmons', 'On the world called Hyperion, beyond the law of the Hegemony of Man, there waits the creature called the Shrike.  There are those who worship it.  There are those who fear it.  And there are those who have vowed to destroy it.  In the Valley of the Time Tombs, where huge, brooding structures move backward through time, the Shrike waits for them all.  On the eve of Armageddon, with the entire galaxy at war, seven pilgrims set forth on a final voyage to Hyperion seeking the answers to the unsolved riddles of their lives.  Each carries a desperate hope--and a terrible secret.  And one may hold the fate of humanity in his hands.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/484900-L.jpg', 1990),
    ('OL16314245W', 'The Dark Forest (The Three-Body Problem Series Book 2)', '刘慈欣', 'Soon to be a Netflix Original Series!

"Wildly imaginative." —President Barack Obama on The Three-Body Problem trilogy

This near-future trilogy is the first chance for English-speaking readers to experience this multiple-award-winning phenomenon from Cixin Liu, China''s most beloved science fiction author.

In The Dark Forest, Earth is reeling from the revelation of a coming alien invasion-in just four centuries'' time. The aliens'' human collaborators may have been defeated, but the presence of the sophons, the subatomic particles that allow Trisolaris instant access to all human information, means that Earth''s defense plans are totally exposed to the enemy. Only the human mind remains a secret. This is the motivation for the Wallfacer Project, a daring plan that grants four men enormous resources to design secret strategies, hidden through deceit and misdirection from Earth and Trisolaris alike. Three of the Wallfacers are influential statesmen and scientists, but the fourth is a total unknown. Luo Ji, an unambitious Chinese astronomer and sociologist, is baffled by his new status. All he knows is that he''s the one Wallfacer that Trisolaris wants dead.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/10526598-L.jpg', 2008),
    ('OL46374W', 'Nightfall', 'Isaac Asimov', 'These two renowned writers have invented a world not unlike our own--a world on the edge of chaos, torn between the madness of religious fanaticism and the stubborn denial of scientists. Only a handful of people on the planet Lagash are prepared to face the truth--that their six suns are setting all at once for the first time in 2,000 years, signaling the end of civilization!', 'Science Fiction', 'https://covers.openlibrary.org/b/id/9302081-L.jpg', 1969),
    ('OL46398W', 'The Naked Sun', 'Isaac Asimov', 'On the remote planet Solaria the first murder for two hundred years has been committed. The Solarians are Spacers with a civilisation based on robots instead of slaves - and some pretty weird taboos and phobias.
Into this strange set-up comes Terran detective Elijah Baley, assigned to find the murderer and act as an investigator for his government. But as an Earthman, Baley finds aspects of life on Solaria difficult, even terrifying, to cope with. (Men on Earth live deep underground in their vast caves of steel and are terrified of anything outside.)
From the moment of his arrival on Solaria, Baley''s investigation becomes an ordeal of nerves under the pitiless glare of the naked sun...', 'Science Fiction', 'https://covers.openlibrary.org/b/id/6542967-L.jpg', 1954),
    ('OL1737320W', 'I Have No Mouth and I Must Scream', 'Harlan Ellison', 'This is a story set in a post-apocalyptic future. The Cold War progressed until it was too complicated for humans to manage, so the three major superpowers each developed a computer program to help run the war. When one of the programs becomes sentient it eliminates all of the human race except five persons, which it tortures for eternity.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/5540875-L.jpg', 1972),
    ('OL29914687W', 'Altered Carbon', 'Richard K. Morgan', NULL, 'Science Fiction', 'https://covers.openlibrary.org/b/id/13223488-L.jpg', 2002),
    ('OL21745884W', 'Project Hail Mary', 'Andy Weir', 'Ryland Grace is the sole survivor on a desperate, last-chance mission–and if he fails, humanity and the earth itself will perish. Except that right now, he doesn’t know that. He can’t even remember his own name, let alone the nature of his assignment or how to complete it. All he knows is that he’s been asleep for a very, very long time. And he’s just been awakened to find himself millions of miles from home, with nothing but two corpses for company.

His crewmates dead, his memories fuzzily returning, he realizes that an impossible task now confronts him. Alone on this tiny ship that’s been cobbled together by every government and space agency on the planet and hurled into the depths of space, it’s up to him to conquer an extinction-level threat to our species.

And thanks to an unexpected ally, he just might have a chance.

Part scientific mystery, part dazzling interstellar journey, *Project Hail Mary* is a tale of discovery, speculation, and survival to rival *The Martian*–while taking us to places it never dreamed of going.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/11200092-L.jpg', 2021),
    ('OL17365W', '2001', 'Arthur C. Clarke', 'A novel that proposes an idea about how the human race might have begun and where it might be headed...given a little help from out there. A colaboration of ideas with director Stanley Kubrick in the late 1960''s it begins at "the dawn of man" and then leaps to the year 2001 where a mission to Saturn (Jupiter in the film) is mounted to try and answer questions raised by the discovery of an ancient artifact dug up on the moon. Though not particularly fast paced, the science is good, and there are a few hair raising events. There are also interesting speculations about the future, such as the space shuttle, and a device eerily similar to an iPad. Leaving plenty of room for contemplation and the appreciation for the inevitable trials of space travel, this is one of the truly landmark pieces of hard science fiction.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/11344400-L.jpg', 1968),
    ('OL893515W', 'God Emperor of Dune', 'Frank Herbert', 'Fourth book in the Dune series. Takes place 3500 years after the events of the original trilogy. Tells the story of Leto, the son of Paul Atreides, who has traded his humanity to become an immortal sandworm of Dune.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/6711531-L.jpg', 1981),
    ('OL15331302W', 'The Mote in God''s Eye', 'Larry Niven, Jerry Pournelle, L.J. Ganser', 'Science fiction classic about the rise, fall and subsequent rise of a civilization where the peak catastrophe is known as the "crazy eddy point". Introduces the concept of frictionless toilets that don''t have any water in them but I suspect the authors didn''t think it all the way through - I don''t recall a negative air pressure that would keep odours in their rightfull place. Nevertheless a fascinating read.
I haven''t read this for donkeys years which is why I''m searching for an e-copy.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/408133-L.jpg', 1974),
    ('OL510435W', 'Lucifer''s Hammer', 'Larry Niven, Jerry Pournelle', 'Lucifer''s Hammer is a post-apocalyptic science fiction novel by Larry Niven and Jerry Pournelle, first published in 1977. It was nominated for the Hugo Award for Best Novel in 1978.
The story details a cometary impact on Earth, an end to civilization, and the battle for the future. It encompasses the discovery of the comet, the LA social scene, and a cast of diverse characters whom fate seems to smile upon and allow to survive the massive cataclysm and the resulting tsunamis, plagues, famines and battles amongst scavengers and cannibals.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/4414184-L.jpg', 1977),
    ('OL46108W', 'The End of Eternity', 'Isaac Asimov', 'The story of temporal engineers who meta-regulate the history of humanity through the centuries, eliminating risk, adventure, and space travel in the process. One man rebels in order to save the existence of someone he loves, and in the end the time bureaucracy is destroyed for the sake of individuality and human achievement. The theme is the opposite of the Foundation stories, where the central planners and manipulators of humanity always dominate.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/6622699-L.jpg', 1955),
    ('OL46399W', 'The Stars, Like Dust', 'Isaac Asimov', 'Biron Farrell was young and naïve, but he was growing up fast. A radiation bomb planted in his dorm room changed him from an innocent student at the University of Earth to a marked man, fleeing desperately from an unknown assassin.

He soon discovers that, many light-years away, his father, the highly respected Rancher of Widemos, has been murdered. Stunned, grief-stricken, and outraged, Biron is determined to uncover the reasons behind his father’s death, and becomes entangled in an intricate saga of rebellion, political intrigue, and espionage.

The mystery takes him deep into space where he finds himself in a relentless struggle with the power-mad despots of Tyrann. Now it is not just a case of life or death for Biron, but a question of freedom for the galaxy.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/6565338-L.jpg', 1951),
    ('OL1963279W', 'Endymion', 'Dan Simmons', 'Dan Simmons''s Hyperion was an immediate sensation on its first publication in 1989.  This staggering multifaceted tale of the far future heralded the conquest of the science fiction field by a man who had already won the World Fantasy Award for his first novel (Song of Kali) and had also published one of the most well-received horror novels in the field, Carrion Comfort.  Hyperion went on to win the Hugo Award as Best Novel, and it and its companion volume, The Fall of Hyperion, took their rightful places in the science fiction pantheon of new classics.

Now, six years later, Simmons returns to this richly imagined world of technological achievement, excitement, wonder and fear.  Endymion is a story about love and memory, triumph and terror--an instant candidate for the field''s highest honors.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/975059-L.jpg', 1995),
    ('OL893461W', 'Dune Messiah', 'Frank Herbert', '**Book Two in the Magnificent Dune Chronicles—the Bestselling Science Fiction Adventure of All Time**

Dune Messiah continues the story of Paul Atreides, better known—and feared—as the man christened Muad’Dib. As Emperor of the known universe, he possesses more power than a single man was ever meant to wield. Worshipped as a religious icon by the fanatical Fremen, Paul faces the enmity of the political houses he displaced when he assumed the throne—and a conspiracy conducted within his own sphere of influence.

And even as House Atreides begins to crumble around him from the machinations of his enemies, the true threat to Paul comes to his lover, Chani, and the unborn heir to his family’s dynasty...', 'Science Fiction', 'https://covers.openlibrary.org/b/id/980253-L.jpg', 1969),
    ('OL17837968W', 'Artemis', 'Andy Weir', '**JASMINE BASHARA** never signed up to be a hero. She just wanted to get rich.

Not crazy, eccentric-billionaire rich, like many of the visitors to her hometown of Artemis, humanity''s first and only lunar colony. Just rich enough to move out of her coffin-sized apartment and eat something better than flavored algae. Rich enough to pay off a debt she''s owed for a long time.

So when a chance at a huge score finally comes her way, Jazz can''t say no. Sure, it requires her to graduate from small-time smuggler to full-on criminal mastermind. And it calls for a particular combination of cunning, technical skills, and large explosions--not to mention sheer brazen swagger. But Jazz has never run into a challenge her intellect can''t handle, and she figures she''s got the "swagger" part down.

The trouble is, engineering the perfect crime is just the start of Jazz''s problems. Because her little heist is about to land her in the middle of a conspiracy for control of Artemis itself.

Trapped between competing forces, pursued by a killer and the law alike, even Jazz has to admit she''s in way over her head. She''ll have to hatch a truly spectacular scheme to have a chance at staying alive and saving her city.

Jazz is no hero, but she is a very good criminal.

That''ll have to do.

Propelled by its heroine''s wisecracking voice, set in a city that''s at once stunningly imagined and intimately familiar, and brimming over with clever problem solving and heisty fun, *Artemis* is another irresistible brew of science, suspense, and humor from #1 bestselling author Andy Weir.

This description comes from the publisher.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/8235551-L.jpg', 2017),
    ('OL59706W', 'Friday', 'Robert A. Heinlein', 'Engineered from the finest genes, and trained to be a secret courier in a future world, Friday operates over a near-future Earth, where chaos reigns. Working at Boss''s whimsical behest she travels from far north to deep south, finding quick, expeditious solutions as one calamity after another threatens to explode in her face....
Fabulous Heinlein world of fascination and intrigue.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/14630717-L.jpg', 1982),
    ('OL103134W', 'The Martian Chronicles', 'Ray Bradbury', 'This is a collection of science fiction short stories, cleverly cobbled together to form a coherent and very readable novel about a future colonization of Mars. As the stories progress chronologically the author tells how the first humans colonized Mars, initially sharing the planet with a handful of Martians. When Earth is devastated by nuclear war the colony is left to fend for itself and the colonists determine to build a new Earth on Mars.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/9346537-L.jpg', 1950),
    ('OL17716925W', 'The Long Way to a Small, Angry Planet', 'Becky Chambers', 'When Rosemary Harper joins the crew of the Wayfarer, she isn''t expecting much. The Wayfarer, a patched-up ship that''s seen better days, offers her everything she could possibly want: a small, quiet spot to call home for a while, adventure in far-off corners of the galaxy, and distance from her troubled past.
But Rosemary gets more than she bargained for with the Wayfarer. The crew is a mishmash of species and personalities, from Sissix, the friendly reptilian pilot, to Kizzy and Jenks, the constantly sparring engineers who keep the ship running. Life on board is chaotic, but more or less peaceful - exactly what Rosemary wants.
Until the crew are offered the job of a lifetime: the chance to build a hyperspace tunnel to a distant planet.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/8902659-L.jpg', 2014),
    ('OL474061W', 'Pandora''s Star', 'Peter F. Hamilton', 'Critics have compared the engrossing space operas of Peter F. Hamilton to the classic sagas of such sf giants as Isaac Asimov and Frank Herbert. But Hamilton''s bestselling fiction--powered by a fearless imagination and world-class storytelling skills--has also earned him comparison to Tolstoy and Dickens. Hugely ambitious, wildly entertaining, philosophically stimulating: the novels of Peter F. Hamilton will change the way you think about science fiction. Now, with Pandora''s Star, he begins a new multivolume adventure, one that promises to be his most mind-blowing yet. The year is 2380. The Intersolar Commonwealth, a sphere of stars some four hundred light-years in diameter, contains more than six hundred worlds, interconnected by a web of transport "tunnels" known as wormholes. At the farthest edge of the Commonwealth, astronomer Dudley Bose observes the impossible: Over one thousand light-years away, a star . . . vanishes. It does not go supernova. It does not collapse into a black hole. It simply disappears. Since the location is too distant to reach by wormhole, a faster-than-light starship, the Second Chance, is dispatched to learn what has occurred and whether it represents a threat. In command is Wilson Kime, a five-time rejuvenated ex-NASA pilot whose glory days are centuries behind him.Opposed to the mission are the Guardians of Selfhood, a cult that believes the human race is being manipulated by an alien entity they call the Starflyer. Bradley Johansson, leader of the Guardians, warns of sabotage, fearing the Starflyer means to use the starship''s mission for its own ends,.Pursued by a Commonwealth special agent convinced the Guardians are crazy but dangerous, Johansson flees. But the danger is not averted. Aboard the Second Chance, Kime wonders if his crew has been infiltrated. Soon enough, he will have other worries. A thousand light-years away, something truly incredible is waiting: a deadly discovery whose unleashing will threaten to destroy the Commonwealth . . . and humanity itself.  Could it be that Johansson was right?From the Hardcover edition.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/7912438-L.jpg', 2004),
    ('OL17897265W', 'A Closed and Common Orbit', 'Becky Chambers', 'Once, Lovelace had eyes and ears everywhere. She was a ship''s artificial intelligence system - possessing a personality and very human emotions. But when her ship was badly damaged, Lovelace was forced to reboot and reset. Now housed in an illegal synthetic body, she''s never felt so isolated.
But Lovelace is not alone. Pepper, an engineer who risked her life to reinstall Lovelace''s program, has remained by her side and is determined to help her.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/8211950-L.jpg', 2016),
    ('OL2950903W', 'Contact', 'Carl Sagan', 'In December, 1999, a multinational team journeys out to the stars, to the most awesome encounter in human history. Who -- or what -- is out there? 
In Cosmos, Carl Sagan explained the universe. In Contact, he predicts its future -- and our own.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/4143957-L.jpg', 1985),
    ('OL38501W', 'Snow Crash', 'Neal Stephenson', 'Within the Metaverse, Hiro is offered a datafile named Snow Crash by a man named Raven who hints that it is a form of narcotic. Hiro''s friend and fellow hacker Da5id views a bitmap image contained in the file which causes his computer to crash and Da5id to suffer brain damage in the real world.

This is the future we now live where all can be brought to life in the metaverse and now all can be taken away. Follow on an adventure with Hiro and YT as they work with the mob to uncover a plot of biblical proportions.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/392508-L.jpg', 1992),
    ('OL109524W', 'Solaris', 'Stanisław Lem', 'The cult-classic by Stanislaw Lem that spawned the movie is now available for your Kindle! Until now the only English edition was a 1970 version, which was translated from French and which Lem himself described as a "poor translation." This wonderful new English translation (by Bill Johnston) of Lem''s classic Solaris is a must-have for fans of Lem''s classic novel.

Telling of humanity''s encounter with an alien intelligence on the planet Solaris, the 1961 novel is a cult classic, exploring the ultimate futility of attempting to communicate with extra-terrestrial life.

When Kris Kelvin arrives at the planet Solaris to study the ocean that covers its surface, he finds a painful, hitherto unconscious memory embodied in the living physical likeness of a long-dead lover. Others examining the planet, Kelvin learns, are plagued with their own repressed and newly corporeal memories. The Solaris ocean may be a massive brain that creates these incarnate memories, though its purpose in doing so is unknown, forcing the scientists to shift the focus of their quest and wonder if they can truly understand the universe without first understanding what lies within their hearts.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/12313764-L.jpg', 1961),
    ('OL27254W', 'Burning Chrome', 'William Gibson', 'Burning Chrome collects Gibson''s early short fiction from the late 70''s and early 80''s.

Contents:
Preface / by Bruce Sterling --
Johnny Mnemonic --
The Gernsback continuum --
Fragments of a hologram rose --
The belonging kind / by John Shirley and William Gibson --
Hinterlands --
Red star, winter orbit / by Bruce Sterling and William Gibson --
New Rose Hotel --
The winter market --
Dogfight / by Michael Swanwick and William Gibson --
Burning chrome.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/28351-L.jpg', 1986),
    ('OL46377W', 'The Robots of Dawn', 'Isaac Asimov', 'A millennium into the future two advances have altered the course of human history: the colonization of the Galaxy and the creation of the positronic brain. Isaac Asimov''s Robot novels chronicle the unlikely partnership between a New York City detective and a humanoid robot who must learn to work together.

Detective Elijah Baley is called to the Spacer world Aurora to solve a bizarre case of roboticide. The prime suspect is a gifted roboticist who had the means, the motive, and the opportunity to commit the crime. There''s only one catch: Baley and his positronic partner, R. Daneel Olivaw, must prove the man innocent. For in a case of political intrigue and love between woman and robot gone tragically wrong, there''s more at stake than simple justice. This time Baley''s career, his life, and Earth''s right to pioneer the Galaxy lie in the delicate balance.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/14372309-L.jpg', 1983),
    ('OL893508W', 'Chapterhouse Dune', 'Frank Herbert', 'The desert planet Arrakis, called Dune, has been destroyed. Now the Bene Gesserit, heirs to Dune''s powers, have colonized a green world and are turning it into a desert, mile by scorched mile.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/5536140-L.jpg', 1985),
    ('OL46125W', 'Foundation', 'Isaac Asimov', 'One of the great masterworks of science fiction, the Foundation novels of Isaac Asimov are unsurpassed for their unique blend of nonstop action, daring ideas, and extensive world-building. 

The story of our future begins with the history of Foundation and its greatest psychohistorian: Hari Seldon.  For twelve thousand years the Galactic Empire has ruled supreme. Now it is dying.  Only Hari Seldon, creator of the revolutionary science of psychohistory, can see into the future--a dark age of ignorance, barbarism, and warfare that will last thirty thousand years. To preserve knowledge and save mankind, Seldon gathers the best minds in the Empire--both scientists and scholars--and brings them to a bleak planet at the edge of the Galaxy to serve as a beacon of hope for future generations. He calls his sanctuary the Foundation.

But soon the fledgling Foundation finds itself at the mercy of corrupt warlords rising in the wake of the receding Empire. And mankind''s last best hope is faced with an agonizing choice: submit to the barbarians and live as slaves--or take a stand for freedom and risk total destruction.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/14612610-L.jpg', 1951),
    ('OL21775531W', 'Destroy Me', 'Tahereh Mafi', 'In Shatter Me, Juliette escaped from The Reestablishment by seducing Warner -- and then putting a bullet in his shoulder. But as she''ll learn in Destroy Me, Warner is not that easy to get rid of . . .

Back at the base and recovering from his near-fatal wound, Warner must do everything in his power to keep his soldiers in check and suppress any mention of a rebellion in the sector. Still as obsessed with Juliette as ever, his first priority is to find her, bring her back, and dispose of Adam and Kenji, the two traitors who helped her escape. But when Warner''s father, the Supreme Commander of The Reestablishment, arrives to correct his son''s mistakes, it''s clear that he has much different plans for Juliette. Plans Warner simply cannot allow', 'Science Fiction', 'https://covers.openlibrary.org/b/id/14427908-L.jpg', 2012),
    ('OL8514692W', 'Blindsight', 'Peter Watts, Peter Watts', '*Two months since the stars fell...*

Two months since sixty-five thousand alien objects clenched around the Earth like a luminous fist, screaming to the heavens as the atmosphere burned them to ash. Two months since that moment of brief, bright surveillance by agents unknown. 

Two months of silence while a world holds its breath. 

Now some half-derelict space probe, sparking fitfully past Neptune''s orbit, hears a whisper from the edge of the solar system: a faint signal sweeping the cosmos like a lighthouse beam. Whatever''s out there isn''t talking to us. It''s talking to some distant star, perhaps. Or perhaps to something closer, something *en route.* 

So who do you send to force introductions on an intelligence with motives unknown, maybe unknowable? Who do you send to meet the alien when the alien doesn''t want to meet? 

You send a linguist with multiple personalities, her brain surgically partitioned into separate, sentient processing cores. You send a biologist so radically interfaced with machinery that he sees X-rays and tastes ultrasound, so compromised by grafts and splices that he no longer feels his own flesh. You send a pacifist warrior in the faint hope she won''t be needed, and a fainter hope that she''ll do any good if she is needed. You send a monster to command them all, an extinct hominid predator once called "vampire," recalled from the grave with the voodoo of recombinant genetics and the blood of sociopaths. And you send a synthesist—an informational topologist with half his mind gone—as an interface between *here* and *there,* a conduit through which the Dead Center might hope to understand the Bleeding Edge. 

You send them all to the edge of interstellar space, praying you can trust such freaks and retrofits with the fate of a world. You fear they may be more alien than the thing they''ve been sent to find. 

But you''d give anything for that to be true, if you only knew what was waiting for them....', 'Science Fiction', 'https://covers.openlibrary.org/b/id/524560-L.jpg', 2006),
    ('OL46309W', 'Second Foundation', 'Isaac Asimov', 'After years of struggle, the Foundation lay in ruins -- destroyed by the mutant mind power of the Mule. But it was rumored that there was a Second Foundation hidden somewhere at the end of the Galaxy, established to preserve the knowledge of mankind through the long centuries of barbarism. The Mule had failed to find it the first time -- but now he was certain he knew where it lay.

The fate of the Foundation rests on young Arkady Darell, only fourteen years old and burdened with a terrible secret. As its scientists girded for a final showdown with the Mule, the survivors of the First Foundation began their desperate search. They too wanted the Second Foundation destroyed... before it destroyed them.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/9261324-L.jpg', 1953),
    ('OL46241W', 'I, Robot', 'Isaac Asimov', 'I, Robot is a fixup novel of science fiction short stories or essays by American writer Isaac Asimov. The stories originally appeared in the American magazines Super Science Stories and Astounding Science Fiction between 1940 and 1950 and were then compiled into a book for stand-alone publication by Gnome Press in 1950, in an initial edition of 5,000 copies. The stories are woven together by a framing narrative in which the fictional Dr. Susan Calvin tells each story to a reporter (who serves as the narrator) in the 21st century. Although the stories can be read separately, they share a theme of the interaction of humans, robots, and morality, and when combined they tell a larger story of Asimov''s fictional history of robotics.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/12385229-L.jpg', 1950),
    ('OL893414W', 'Dune', 'Frank Herbert', 'Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the "spice" melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for...

When House Atreides is betrayed, the destruction of Paul''s family will set the boy on a journey toward a destiny greater than he could ever have imagined. And as he evolves into the mysterious man known as Muad''Dib, he will bring to fruition humankind''s most ancient and unattainable dream.

A stunning blend of adventure and mysticism, environmentalism and politics, Dune won the first Nebula Award, shared the Hugo Award, and formed the basis of what is undoubtedly the grandest epic in science fiction.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/11481354-L.jpg', 1965),
    ('OL59740W', 'Starship Troopers', 'Robert A. Heinlein', 'Starship Troopers takes place in the midst of an interstellar war between the Terran Federation of Earth and the Arachnids (referred to as "The Bugs") of Klendathu. It is narrated as a series of flashbacks by Juan Rico, and is one of only a few Heinlein novels set out in this fashion.  The novel opens with Rico aboard the corvette  Rodger Young, about to embark on a raid against the planet of the "Skinnies," who are allies of the Arachnids. We learn that he is a cap(sule) trooper in the Terran Federation''s Mobile Infantry. The raid itself, one of the few instances of actual combat in the novel, is relatively brief: the Mobile Infantry land on the planet, destroy their targets, and retreat, suffering a single casualty in the process.

The story then flashes back to Rico''s graduation from high school, and his decision to sign up for Federal Service over the objections of his father. This is the only chapter that describes Rico''s civilian life, and most of it is spent on the monologues of two people: retired Lt. Col. Jean V. Dubois, Rico''s school instructor in "History and Moral Philosophy," and Fleet Sergeant Ho, a recruiter for the armed forces of the Terran Federation.

Dubois serves as a stand-in for Heinlein throughout the novel, and delivers what is probably the book''s most famous soliloquy on violence, and how it "has settled more issues in history than has any other factor." Fleet Sergeant Ho''s monologues examine the nature of military service, and his anti-military tirades appear in the book primarily as a contrast with Dubois. (It is later revealed that his rants are calculated to scare off the weaker applicants).

Interspersed throughout the book are other flashbacks to Rico''s high school History and Moral Philosophy course, which describe how in the Terran Federation of Rico''s day, the rights of a full Citizen (to vote, and hold public office) must be earned through some form of volunteer Federal service. Those residents who have not exercised their right to perform this Federal Service retain the other rights generally associated with a modern democracy (free speech, assembly, etc.), but they cannot vote or hold public office. This structure arose ad hoc after the collapse of the 20th century Western democracies, brought on by both social failures at home and military defeat by the Chinese Hegemony overseas (assumed looking forward into the late 20th century from the time the novel was written in the late 1950s).

In the next section of the novel Rico goes to boot camp at Camp Arthur Currie, on the northern prairies. Five chapters are spent exploring Rico''s experience entering the service under the training of his instructor, Career Ship''s Sergeant Charles Zim. Camp Currie is so rigorous that less than ten percent of the recruits finish basic training; the rest either resign, are expelled, or die in training. One of the chapters deals with Ted Hendrick, a fellow recruit and constant complainer who is flogged and expelled for striking a superior officer. Another recruit, a deserter who committed a heinous crime while AWOL, is hanged by his battalion. Rico himself is flogged for poor handling of (simulated) nuclear weapons during a drill; despite these experiences he eventually graduates and is assigned to a unit.

At some point during Rico''s training, the ''Bug War'' has begun to brew, and Rico finds himself taking part in combat operations. The war "officially" starts with an Arachnid attack that annihilates the city of Buenos Aires, although Rico makes it clear that prior to the attack there were plenty of "''incidents,'' ''patrols,'' or ''police actions.''" Rico briefly describes the Terran Federation''s loss at the Battle of Klendathu where his unit is decimated and his ship destroyed. Following Klendathu, the Terran Federation is reduced to making hit-and-run raids similar to the one described at the beginning of the novel (which, chronologically would be placed between Chapters 10 and 11). Rico meanwhile finds himself posted to Rasczak''s Roughnecks, named after Lieutenant Rasczak (his first name is never given). This part of the book focuses on the daily routine of military life, as well as the relationship between officers and non-commissioned officers, personified in this case by Rasczak and Sergeant Jelal.

Eventually, Rico decides to become a career soldier and attends Officer Candidate School, which turns out to be just like boot camp, only "squared and cubed with books added."[15] Rico is commissioned a temporary Third Lieutenant as a field-test final exam and commands his own unit during Operation Royalty; eventually he graduates as a Second Lieutenant and full-fledged officer.

The final chapter serves as more of a coda, depicting Rico aboard the Rodger Young as the lieutenant in command of Rico''s Roughnecks, preparing to drop to Klendathu as part of a major strike, with his father (having joined the Service earlier in the novel) as his senior sergeant and a Third Lieutenant-in-…', 'Science Fiction', 'https://covers.openlibrary.org/b/id/14630746-L.jpg', 1959),
    ('OL893502W', 'Heretics of Dune', 'Frank Herbert', 'With more than ten million copies sold, Frank Herbert''s magnificent Dune books stand among the major achievements of the human imagination. In this, the fifth and most spectacular Dune book of all, the planet Arrakis--now called Rakis--is becoming desert again. The Lost Ones are returning home from the far reaches of space. The great sandworms are dying. And the children of Dune''s children awaken from empire as from a dream, wielding the new power of a heresy called love...', 'Science Fiction', 'https://covers.openlibrary.org/b/id/284530-L.jpg', 1984),
    ('OL1975714W', 'A Fire upon the Deep', 'Vernor Vinge', 'Thousands of years in the future, humanity is no longer alone in a universe where a mind''s potential is determined by its location in space, from superintelligent entities in the Transcend, to the limited minds of the Unthinking Depths, where only simple creatures, and technology, can function. Nobody knows what strange force partitioned space into these "regions of thought," but when the warring Straumli realm use an ancient Transcendent artifact as a weapon, they unwittingly unleash an awesome power that destroys thousands of worlds and enslaves all natural and artificial intelligence.

Fleeing this galactic threat, Ravna crash lands on a strange world with a ship-hold full of cryogenically frozen children, the only survivors from a destroyed space-lab. They are taken captive by the Tines, an alien race with a harsh medieval culture, and used as pawns in a ruthless power struggle.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/9261466-L.jpg', 1992),
    ('OL46178W', 'Robots and Empire', 'Isaac Asimov', 'Esta quinta novela de la «Serie de los robots» supone un sensacional hito en la galaxia de ciencia ficción de Asimov y constituye la apasionante continuación del bestseller Los robots del amanecer .

En Robots e imperio vemos cómo el futuro del universo corre peligro. Aunque se han debilitado las fuerzas de los siniestros Spacers, el doctor Kelden Amadiro no ha olvidado -ni perdonado- su humillante derrota a manos de Elijah Baley, el adorado héroe de la población terrestre. Amadiro ansía la venganza y está más decidido que nunca a consumar la destrucción del planeta Tierra.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/9302088-L.jpg', 1985),
    ('OL5734646W', 'The Last Colony', 'John Scalzi', 'Serving his human colony on distant Huckleberry as a village ombudsman, retired fighter John Perry looks forward to settling into farm life with his wife and adopted daughter before he is drawn back into the dangerous interstellar politics of his past.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/524768-L.jpg', 2007),
    ('OL1975705W', 'A Deepness in the Sky (Zones of Thought)', 'Vernor Vinge', 'From inside cover Tor First Edition March 1999:

Thirty thousand years before the events of *A Fire upon the Deep*, Pham Nuwen is living in anonymity among the Qeng Ho interstellar trading fleet.  In high orbit above the planet Arachna, they wait for the awakening of its dormant population, the Spiders, who have burrowed deep into the planet, awaiting the relighting of the On/Off star their planet orbits.  For when light returns, Arachna will at long last explode into a Golden Age of technology and commerce.

But the slumbering Spiders'' vulnerability has attracted another lurking presence -- the Emergents, a band of traders whose plans for Arachna are more sinister than anything the Qeng Ho could envision.

Reluctant to share their spoils with the Qeng Ho, the Emergents unleash an attack unlike any seen in the Qeng Ho''s millennia-long history of exploration, reducing their fleet to serfdom... and then to something worse.

Reaching into memories so old and painful he can barely recall them, Pham gathers the other "survivors" about him and makes a final attempt to be worthy of a reputation as ancient and storied as the history of the Qeng Ho itself.  But time is running out, for soon the Emergents'' assault will strip Arachna bare.

As Pham''s underground resistance cell struggles against its torturers in space, a wondrously gifted clan of Spiders on the planet below fights another battle - to advance their technology quickly enough to defeat their terrestrial foes, and to somehow overcome the invisible enemy lurking above.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/603591-L.jpg', 1999),
    ('OL17755458W', 'Nemesis Games', 'James S. A. Corey', NULL, 'Science Fiction', 'https://covers.openlibrary.org/b/id/8036735-L.jpg', 2015),
    ('OL2172454W', 'Ubik', 'Philip K. Dick', 'Named one of Time''s 100 Best Books, Ubik is a mind-bending, classic novel about the perception of reality from Philip K. Dick, the Hugo Award-winning author of The Man in the High Castle. “From the stuff of space opera, Dick spins a deeply unsettling existential horror story, a nightmare you’ll never be sure you’ve woken up from.”—Lev Grossman, Time Glen Runciter runs a lucrative business — deploying his teams of anti-psychics to corporate clients who want privacy and security from psychic spies. But when he and his top team are ambushed by a rival, he is gravely injured and placed in “half-life,” a dreamlike state of suspended animation. Soon, though, the surviving members of the team begin experiencing some strange phenomena, such as Runciter’s face appearing on coins and the world seeming to move backward in time. As consumables deteriorate and technology gets ever more primitive, the group needs to find out what is causing the shifts and what a mysterious product called Ubik has to do with it all. “More brilliant than similar experiments conducted by Pynchon or DeLillo.”—Roberto Bolaño', 'Science Fiction', 'https://covers.openlibrary.org/b/id/5018327-L.jpg', 1969),
    ('OL17062642W', 'Ancillary Sword', 'Ann Leckie', 'Breq is a soldier who used to be a warship. Once a weapon of conquest controlling thousands of minds, now she has only a single body and serves the emperor.

With a new ship and a troublesome crew, Breq is ordered to go to the only place in the galaxy she would agree to go: to Athoek Station to protect the family of a lieutenant she once knew - a lieutenant she murdered in cold blood.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/7422984-L.jpg', 2014),
    ('OL38499W', 'The Diamond Age', 'Neal Stephenson', 'The story of an engineer who creates a device to raise a girl capable of thinking for herself reveals what happens when a young girl of the poor underclass obtains the device.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/8598269-L.jpg', 1995),
    ('OL43426400W', 'Sunrise on the Reaping', 'Suzanne Collins', 'As the day dawns on the fiftieth annual Hunger Games, fear grips the districts of Panem. This year, in honor of the Quarter Quell, twice as many tributes will be taken from their homes.

Back in District 12, Haymitch Abernathy is trying not to think too hard about his chances. All he cares about is making it through the day and being with the girl he loves.

When Haymitch''s name is called, he can feel all his dreams break. He''s torn from his family and his love, shuttled to the Capitol with the three other District 12 tributes: a young friend who''s nearly a sister to him, a compulsive oddsmaker, and the most stuck-up girl in town. As the Games begin, Haymitch understands he''s been set up to fail. But there''s something in him that wants to fight . . . and have that fight reverberate far beyond the deadly arena.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/14847912-L.jpg', 2025),
    ('OL46347W', 'Foundation and Earth', 'Isaac Asimov', 'Golan Trevize, Janov Pelorat, Bliss go looking for earth.', 'Science Fiction', 'https://covers.openlibrary.org/b/id/9304027-L.jpg', 1986),
    ('OL27252W', 'The Difference Engine', 'William Gibson, Bruce Sterling', '<Blockquote> 1855: The Industrial Revolution is in full and inexorable swing, powered by steam-driven cybernetic Engines. Charles Babbage perfects his Analytical Engine and the computer age arrives a century ahead of its time. And three extraordinary characters race toward a rendezvous with history - and the future: Sybil Gerard - dishonored woman and daughter of a Luddite agitator; Edward "Leviathan" Mallory - explorer and paleontologist; Laurence Oliphant - diplomat and spy. Their adventure begins with the discovery of a box of punched Engine cards of unknown origin and purpose. Cards someone wants badly enough to kill for...

Part detective story, part historical thriller, The Difference Engine is the first collaborative novel by two of the most brilliant and controversial science fiction authors of our time. Provocative, compelling, intensely imagined, it is a startling extension of Gibson''s and Sterling''s unique visions - in a new and totally unexpected direction!

> 
> -Goodreads', 'Science Fiction', 'https://covers.openlibrary.org/b/id/4034359-L.jpg', 1990),
    ('OL34224558W', 'Never Lie', 'Freida McFadden', 'Newlyweds Tricia and Ethan are searching for the house of their dreams.

But when they visit the remote manor that once belonged to Dr. Adrienne Hale, a renowned psychiatrist who vanished without a trace four years earlier, a violent winter storm traps them at the estate… with no chance of escape until the blizzard comes to an end.

In search of a book to keep her entertained until the snow abates, Tricia happens upon a secret room. One that contains audio transcripts from every single patient Dr. Hale has ever interviewed. As Tricia listens to the cassette tapes, she learns about the terrifying chain of events leading up to Dr. Hale’s mysterious disappearance.

Tricia plays the tapes one by one, late into the night. With each one, another shocking piece of the puzzle falls into place, and Dr. Adrienne Hale’s web of lies slowly unravels.

And then Tricia reaches the final cassette.

The one that reveals the entire horrifying truth.', 'Mystery', 'https://covers.openlibrary.org/b/id/13198561-L.jpg', 2022),
    ('OL472165W', 'Peril at End House', 'Agatha Christie', 'Hercule Poirot is vacationing on the Cornish coast when he meets Nick Buckley. Nick is the young and reckless mistress of End House, an imposing structure perched on the rocky cliffs of St. Loo.

Poirot quickly takes a particular interest in the young woman. Recently, she has narrowly escaped a series of life-threatening accidents. Something tells the Belgian sleuth that these so-called accidents are more than just mere coincidences or a spate of bad luck. Something like a bullet! It seems all too clear to him that someone is trying to do away with poor Nick, but who? And, what is the motive? In his quest for answers, Poirot must delve into the dark history of End House. The deeper he gets into his investigation, the more certain he is that the killer will soon strike again. And, this time, Nick may not escape with her life.', 'Mystery', 'https://covers.openlibrary.org/b/id/12996556-L.jpg', 1932),
    ('OL472549W', 'The Man in the Brown Suit', 'Agatha Christie', 'Newly-orphaned Anne Beddingfeld is a nice English girl looking for a bit of adventure in London. But she stumbles upon more than she bargained for! Anne is on the platform at Hyde Park Corner tube station when a man falls onto the live track, dying instantly. A doctor examines the man, pronounces him dead, and leaves, dropping a note on his way. Anne picks up the note, which reads "17.1 22 Kilmorden Castle". The next day the newspapers report that a beautiful ballet dancer has been found dead there-- brutally strangled. A fabulous fortune in diamonds has vanished. And now, aboard the luxury liner Kilmorden Castle, mysterious strangers pillage her cabin and try to strangle her. What are they looking for? Why should they want her dead? Lovely Anne is the last person on earth suited to solve this mystery... and the only one who can! Anne''s journey to unravel the mystery takes her as far afield as Africa and the tension mounts with every step... and Anne finds herself struggling to unmask a faceless killer known only as ''The Colonel''....', 'Mystery', 'https://covers.openlibrary.org/b/id/11153508-L.jpg', 1924),
    ('OL472542W', 'The Secret of Chimneys', 'Agatha Christie', 'A bit of adventure and quick cash is all that good-natured drifter Anthony Cade is looking for when he accepts a messenger job from an old friend. It sounds so simple: deliver the provocative memoirs of a recently deceased European count to a London publisher. Little did Anthony suspect that a simple errand to deliver the manuscript on behalf of his friend would drop him right in the middle of an international conspiracy, and he begins to realize that it has placed him in serious danger. Why were Count Stylptich''s memoirs so important? And what was "King Victor" really after? The parcel holds ore than scandalous royal secrets - because it contains a stash of letters that suggest blackmail. Someone would stop at nothing to prevent the monarchy being restored in faraway Herzoslovakia.

Wherever ravishing Virginia Revel went, death seemed sure to follow. First her husband died. The next to perish was a foreign prince whose ruthless power was matched by his scandalous passions. Then a bungling blackmailer followed them into the grave. Murder, blackmail, stolen letters, and a fabulous missing jewel: all under the not always co-operative eyes of Scotland Yard and the Surete. All threads lead to Chimneys, one of England''s historic country house estates, where a master murderer mingled with the aristocratic guests. Virginia could turn to only one person to prove her innocence and end her nightmare, and she could only pray that she had not put her life into the hands of the man who was out to take it....

This novel was published in 1925 by Bodley Head in London, and by Dodd, Mead & Co. in New York. The Times Literary Supplement described it as "a thick fog of mystery, cross purposes, and romance, which leads up to a most unexpected and highly satisfactory ending".Chimneys was adapted by Christie as a stage play but was not performed until 2003, in Canada. It was filmed with the addition of Julia McKenzie as Miss Marple by ITV in 2009.', 'Mystery', 'https://covers.openlibrary.org/b/id/12996574-L.jpg', 1925),
    ('OL265415W', 'At Bertram''s Hotel', 'Agatha Christie', '**An old-fashioned London Hotel is not quite as reputable as it makes out… When Miss Marple comes up from the country for a holiday in London, she finds what she’s looking for at Bertram’s Hotel: traditional decor, impeccable service and an unmistakable atmosphere of danger behind the highly polished veneer. Yet, not even Miss Marple can foresee the violent chain of events set in motion when an eccentric guest makes his way to the airport on the wrong day…**', 'Mystery', 'https://covers.openlibrary.org/b/id/6379981-L.jpg', 1965),
    ('OL471500W', '4:50 from Paddington', 'Agatha Christie', 'Agatha Christie’s audacious mystery thriller, reissued with a striking new cover designed to appeal to the latest generation of Agatha Christie fans and book lovers.

For an instant the two trains ran together, side by side. In that frozen moment, Elspeth witnessed a murder. Helplessly, she stared out of her carriage window as a man remorselessly tightened his grip around a woman’s throat. The body crumpled. Then the other train drew away.

But who, apart from Miss Marple, would take her story seriously? After all, there were no suspects, no other witnesses… and no corpse.', 'Mystery', 'https://covers.openlibrary.org/b/id/13151352-L.jpg', 1957),
    ('OL471990W', 'The Mirror Crack''d from Side to Side', 'Agatha Christie', 'E-book exclusive extras:1) Christie biographer Charles Osborne''s essay on The Mirror Crack''d from Side to Side;2) "The Marples": the complete guide to all the cases of crime literature''s foremost female detective.The quaint village of St Mary Mead has been glamourized by the presence of screen queen Marina Gregg, who has taken up residence in preparation for her comeback. But when a local fan is poisoned, Marina finds herself starring in a real-life mystery—supported with scene-stealing aplomb by Jane Marple, who suspects that the lethal cocktail was intended for someone else. But who? If it was meant for Marina, then why? And before the final fade-out, who else from St Mary Mead’s cast of seemingly innocent characters is going to be eliminated?', 'Mystery', 'https://covers.openlibrary.org/b/id/10561150-L.jpg', 1960),
    ('OL31191485W', 'The Inmate', 'Freida McFadden', 'There are three rules Brooke Sullivan must follow as a new nurse practitioner at a men''s maximum-security
1) Treat all prisoners with respect.
2) Never reveal any personal information.
3) Never EVER become too friendly with the inmates.

But none of the staff at the prison knows Brooke has already broken the rules. Nobody knows about her intimate connection to Shane Nelson, one of the penitentiary''s most notorious and dangerous inmates. And they certainly don''t know that Shane was Brooke''s high school sweetheart-the star quarterback who is now spending the rest of his life in prison for a series of grisly murders. Or that Brooke''s testimony was what put him there. 

But Shane knows. And he will never forget.', 'Mystery', 'https://covers.openlibrary.org/b/id/15125020-L.jpg', 2022),
    ('OL471832W', 'Hallowe''en Party', 'Agatha Christie', 'Mystery writer Ariadne Oliver has been invited to a Hallowe’en party at Woodleigh Common. One of the other guests is an adolescent girl known for telling tall tales of murder and intrigue -- and for being generally unpleasant. But when the girl, Joyce, is found drowned in an apple-bobbing tub, Mrs Oliver wonders after the fictional nature of the girl’s claim that she had once witnessed a murder. Which of the party guests wanted to keep her quiet is a question for Ariadne’s friend Hercule Poirot. But unmasking a killer this Hallowe’en is not going to be easy -- for there isn’t a soul in Woodleigh who believes the late little storyteller was actually murdered.', 'Mystery', 'https://covers.openlibrary.org/b/id/11160095-L.jpg', 1969),
    ('OL471947W', 'The Big Four', 'Agatha Christie', 'They are a vicious international quartet of criminals known as "The Big Four". Number One was a brilliant Chinese, the greatest criminal brain of all time; Number Two was a USAmerican multi-millionaire; Number Three was a beautiful Frenchwoman scientist; and Number Four was "the destroyer," the ruthless murderer with a genius for disguise, whose business it was to remove those who interfered with his masters plans. These four, working together, is a partnership with one simple goal, establish world dominance with murders.

Belgian detective Hercule Poirot was preparing for a voyage to South America when an uninvited guest, coated from head to foot in mud, stood at his doorway, collapsed, then recovered long enough to scribble the number four on a piece of paper. Now, "The Big Four" pursues eliminate the only man who can foil them: Hercule Poirot. It''s up to Poirot and his faithful assistant Hastings to follow the clues and stop the deadly cabal from achieving its devastating end. But do they really avoid the Grim Reaper? In the most dangerous case of his career, the little detective will not be diverted by poison, a falling tree, electrocution, or a hit-and-run. Poirot appears to meet his end when a bomb explodes in his apartment. Hastings, devastated, vows to avenge him--but can he succeed without Poirot?', 'Mystery', 'https://covers.openlibrary.org/b/id/12996529-L.jpg', 1927),
    ('OL471932W', 'The Murder of Roger Ackroyd', 'Agatha Christie', 'Belgian Inspector Hercule Poirot has retired to the countryside in the small English village of King''s Abbot. Dr. Sheppard, observing his new neighbor, is sure that he must be a former hairdresser. But the brutal murder of a local squire reveals the truth: the peculiar little man is actually a detective par excellence. The Murder of the wealthy industrialist Roger Ackroyd begins the night before with the suicide of Mrs. Ferrars, a wealthy widow. Her death is believed to be an accident, until Roger Ackroyd is stabbed to death in his locked study. There are rumors she poisoned her first husband, rumors that she was being blackmailed, rumors that her secret lover was Roger Ackroyd, a man who knew too much, but no one is sure.

There''s no shortage of suspects, all the members of the household stand to gain from his death, from Roger''s neurotic sister-in-law who has accumulated personal debts, to a parlormaid with an uncertain history who resigned her post the afternoon of the murder. But the police focus on Ralph Paton, Ackroyd''s stepson and heir, and the person with the most to gain from Roger''s death. When sleuth Hercule Poirot, who is living quietly in King''s Abbot, agrees to investigate, the case takes a completely different turn. Poirot exonerates all of the original suspects, and lays out a completely reasoned case that the clever and devious murderer is someone who had not come under suspicion at all - someone whose motive has nothing to do with money.
(source)', 'Mystery', 'https://covers.openlibrary.org/b/id/13151356-L.jpg', 1926),
    ('OL471943W', 'After the Funeral', 'Agatha Christie', 'When Cora is savagely murdered with a hatchet, the extraordinary remark she made the previous day at her brother Richard''s funeral suddenly takes on a chilling significance. At the reading of Richard''s will, Cora was clearly heard to say: ''It''s been hushed up very nicely, hasn''t it. But he was murdered, wasn''t he?'' In desperation, the family solicitor turns to Hercule Poirot to unravel the mystery.', 'Mystery', 'https://covers.openlibrary.org/b/id/12996535-L.jpg', 1953),
    ('OL471871W', 'They Do It with Mirrors', 'Agatha Christie', 'E-book exclusive extras:1) Christie biographer Charles Osborne''s essay on They Do It with Mirrors;2) "The Marples": the complete guide to all the cases of crime literature''s foremost female detective.A sense of danger pervades the rambling Victorian mansion in which Jane Marple’s friend Carrie Louise lives—and not only because the building doubles as a rehabilitation centre for criminal youths. One inmate attempts, and fails, to shoot dead the administrator. But simultaneously, in another part of the building, a mysterious visitor is less lucky. Miss Marple must employ all her cunning to solve the riddle of the stranger’s visit, and his murder—while protecting her friend from a similarly dreadful fate.The New York Times: ‘No one on either side of the Atlantic does it better.’', 'Mystery', 'https://covers.openlibrary.org/b/id/10249524-L.jpg', 1952),
    ('OL20878311W', 'The Thursday Murder Club', 'Richard Osman', 'In a peaceful retirement village, four unlikely friends meet up once a week to investigate unsolved murders.

But when a brutal killing takes place on their very doorstep, the Thursday Murder Club find themselves in the middle of their first live case. Elizabeth, Joyce, Ibrahim and Ron might be pushing eighty but they still have a few tricks up their sleeves.

Can our unorthodox but brilliant gang catch the killer before it''s too late?', 'Mystery', 'https://covers.openlibrary.org/b/id/10201431-L.jpg', 2020),
    ('OL39160W', 'The Hidden Staircase', 'Leslie McFarlane', 'Teenage detective Nancy Drew uses her courage and powers of deduction to solve the mysterious happenings in an old stone mansion.', 'Mystery', 'https://covers.openlibrary.org/b/id/15150728-L.jpg', 1930),
    ('OL471940W', 'Poirot investigates', 'Agatha Christie', 'in published order, the first 10 Christie mystery books featuring Poirot are: 1) The Mysterious Affair at Styles, 2) The Murder on the Links, 3) Poirot Investigates, 4) The Murder of Roger Ackroyd, 5) The Big Four, 6) The Mystery of the Blue Train, 7) Black Coffee: A Mystery Play in Three Acts [Charles Osborne novelized the play in 1998 under the title, Black Coffee], 8) Peril at End House, 9) Lord Edgware Dies, and 10) Murder on the Orient Express. Each has its own entry on Goodreads.', 'Mystery', 'https://covers.openlibrary.org/b/id/13670505-L.jpg', 1924),
    ('OL15400582W', 'The Big Sleep', 'Raymond Chandler', 'Philip Marlowe, a private eye who operates in Los Angeles''s seamy underside during the 1930s, takes on his first case, which involves a paralyzed California millionaire, two psychotic daughters, blackmail, and murder', 'Mystery', 'https://covers.openlibrary.org/b/id/7268475-L.jpg', 1939),
    ('OL471765W', 'Murder in Three Acts', 'Agatha Christie', 'Sir Charles Cartwright should have known better than to allow thirteen guests to sit down for dinner. For at the end of the evening one of them is dead—choked by a cocktail that contained no trace of poison.

Predictable, says Hercule Poirot, the great detective. But entirely unpredictable is that he can find absolutely no motive for murder.…', 'Mystery', 'https://covers.openlibrary.org/b/id/6874620-L.jpg', 1934),
    ('OL28953746W', 'Brain Damage', 'Freida McFadden', 'After years of hard work, Dr. Charly McKenna finally has it all. Prosperous career as a dermatologist? Check. Spacious apartment overlooking Central Park? Check. Handsome lawyer husband? Double check.

Then one night, a bullet rips through the right side of her skull and she loses everything.

As Charly struggles to recover from her brain injury, she begins to realize that the events of that fateful night are trapped in the damaged right side of her brain. Now she must put the jigsaw pieces together to discover the identity of the man who tried to kill her... before he finishes the job he started.', 'Mystery', 'https://covers.openlibrary.org/b/id/15263337-L.jpg', 2016),
    ('OL28954802W', 'The Locked Door', 'Freida McFadden', '**Some doors are locked for a reason…**

While eleven-year-old Nora Davis was up in her bedroom doing homework, she had no idea her father was killing women in the basement.

Until the day the police arrived at their front door.

Decades later, Nora’s father is spending his life behind bars, and Nora is a successful surgeon with a quiet, solitary existence. Nobody knows her father was a notorious serial killer. And she intends to keep it that way.

Then Nora discovers one of her young female patients has been murdered. In the same unique and horrific manner that her father used to kill his victims.', 'Mystery', 'https://covers.openlibrary.org/b/id/13156268-L.jpg', 2021),
    ('OL262438W', 'The Sign of Four', 'Arthur Conan Doyle', 'The Sign of the Four (1890), also called The Sign of Four, is the second novel featuring Sherlock Holmes written by Sir Arthur Conan Doyle.', 'Mystery', 'https://covers.openlibrary.org/b/id/9247987-L.jpg', 1889),
    ('OL472250W', 'Sleeping Murder', 'Agatha Christie', '"Let sleeping murder lie": this is the proverb (a variation on "Let sleeping dogs lie") which is not obeyed by twenty-one-year-old New Zealander Gwenda Reed, who has recently married and now comes to England to settle down there.  While her husband, Giles, is out of the country, she buys a house for them and starts recalling memories which make her start to think that perhaps she had lived in the house before. She knows the pattern of the old wallpaper they find on the walls, the location of a now covered over doorway, a set of steps in the garden that are not where they should be, and so on. When she begins to remember seeing someone murdered at the bottom of the staircase however, she is convinced she is going mad. Miss Marple however has an explanation not only for why she may be having these memories but also solves the mystery of the murder victim and her murderer. 

Sleeping Murder chronicles Miss Marple’s final case. Although Agatha Christie wrote it before Nemesis, it was not published until after her death in 1976. It is thought to have been written in the early 1940s, although the exact date has been debated', 'Mystery', 'https://covers.openlibrary.org/b/id/10247294-L.jpg', 1940),
    ('OL471666W', 'Five Little Pigs', 'Agatha Christie', 'Sixteen years after Caroline Crale has been convicted of the murder of her husband, Amyas Crale, her daughter, Carla Lemarchant, approaches Poirot to investigate the case. Poirot embarks optimistically upon an unprecedented challenge, but soon fears that the case may be as cut and dried as it had first appeared.', 'Mystery', 'https://covers.openlibrary.org/b/id/14578138-L.jpg', 1942),
    ('OL472594W', 'Nemesis', 'Agatha Christie', 'E-book exclusive extras:1) Christie biographer Charles Osborne''s essay on Nemesis;2) "The Marples": the complete guide to all the cases of crime literature''s foremost female detective.Even the unflappable Miss Marple is astounded as she reads the letter addressed to her on instructions from the recently deceased tycoon Mr Jason Rafiel, whom she had met on holiday in the West Indies (A Caribbean Mystery). Recognising in her a natural flair for justice and a genius for crime-solving, Mr Rafiel has bequeathed to Miss Marple a £20,000 legacy—and a legacy of an entirely different sort. For he has asked Miss Marple to investigate…his own murder. The only problem is, Mr Rafiel has failed to name a suspect or suspects. And, whoever they are, they will certainly be determined to thwart Miss Marple’s inquiries—no matter what it will take to stop her.Of note: Nemesis is the last Jane Marple mystery that Agatha Christie wrote—though not the last Marple published.', 'Mystery', 'https://covers.openlibrary.org/b/id/10249139-L.jpg', 1970),
    ('OL471891W', 'Crooked House', 'Agatha Christie', 'Three generations of the Leonides family live together in a large, if somewhat crooked looking, house. Then the wealthy patriarch, Aristide, is murdered. Suspicion falls on the whole household, including Aristide''s two sons, his widow – fifty years his junior – and even his three grandchildren. Could any member of this seemingly devoted family have had a hand in his death? Can Charles Hayward, fiance of the late millionaire''s granddaughter, help the police find the killer and clear his loved one''s name?Christie always acknowledged this novel as one of her favourites. She said in an interview in The Sunday Times that she enjoyed best writing the Crooked House type novel, "which depends on a family and the interplay of their lives."', 'Mystery', 'https://covers.openlibrary.org/b/id/14570595-L.jpg', 1949),
    ('OL471895W', 'The Murder at the Vicarage', 'Agatha Christie', '***Murder at the Vicarage (1930)is the first Miss Marple mystery book by Agatha Christie.***  Miss Jane Marple is a village busybody who applies human nature to crimes. Colonel Protheroe, magistrate universally despised, was shot in his study, unheard. His wife Anne admits newly arrived artist Lawrence Redding is an old flame, and both confess to murder. **The local inspector and Miss Marple sort through to the truth.**

***The murder of Colonel Protheroe shocks the town of St. Mary Mead, where the main entertainment is tea and gossip.*** Among the neighbors of St. Mary Mead, the most meddlesome, observant and shrewd person is Miss Marple. His intervention will be decisive in the resolution of a crime for which there are no suspects.

***Death in the vicarage, published in 1930, was the first appearance of one of the most important characters in the work of Agatha Christie, the spinster and insightful Miss Marple, whose cases have been adapted several times both to the cinema and in Form of television series.***', 'Mystery', 'https://covers.openlibrary.org/b/id/12996560-L.jpg', 1930),
    ('OL472044W', 'Mrs. McGinty''s Dead', 'Agatha Christie', 'Poirot, disillusioned by the "senseless cruel brutality" of modern crime, pays no attention to the sad case of Mrs McGinty, an old woman apparently struck dead by her lodger for thirty pounds that she kept under a floorboard. When, however, he is asked by the investigating officer to take another look at the case to stop an innocent man going to the gallows, he realises that things may not be as simple as they first appear to be.', 'Mystery', 'https://covers.openlibrary.org/b/id/10249324-L.jpg', 1951),
    ('OL471565W', 'And Then There Were None', 'Agatha Christie', 'And Then There Were None is a mystery novel by the English writer Agatha Christie, described by her as the most difficult of her books to write. It was first published in the United Kingdom by the Collins Crime Club on 6 November 1939, as Ten Little Niggers, after the children''s counting rhyme and minstrel song, which serves as a major element of the plot. A US edition was released in January 1940 with the title And Then There Were None, which is taken from the last five words of the song. All successive American reprints and adaptations use that title, except for the Pocket Books paperbacks published between 1964 and 1986, which appeared under the title Ten Little Indians. UK editions continued to use the original title until the current definitive title appeared with a reprint of the 1963 Fontana Paperback in 1985.

In 1990 Crime Writers'' Association ranked And Then There Were None 19th in their The Top 100 Crime Novels of All Time list. In 1995 in a similar list Mystery Writers of America ranked the novel 10th. In September 2015, to mark her 125th birthday, And Then There Were None was named the "World''s Favourite Christie" in a vote sponsored by the author''s estate. In the "Binge!" article of Entertainment Weekly Issue #1343-44 (26 December 2014–3 January 2015), the writers picked And Then There Were None as an "EW favorite" on the list of the "Nine Great Christie Novels".', 'Mystery', 'https://covers.openlibrary.org/b/id/11172296-L.jpg', 1939),
    ('OL262452W', 'His Last Bow [8 stories]', 'Arthur Conan Doyle', 'The adventure of Wisteria lodge.--The adventure of the cardboard box.--The adventure of the red circle.--The adventure of the Bruce-Partington plans.--The adventure of the dying detective.--The disappearance of Lady Frances Carfax.--The adventure of the devil''s foot.--His last bow.', 'Mystery', 'https://covers.openlibrary.org/b/id/8243267-L.jpg', 1917),
    ('OL262421W', 'The Adventures of Sherlock Holmes [12 stories]', 'Arthur Conan Doyle', 'The Adventures of Sherlock Holmes is a collection of twelve short stories by Arthur Conan Doyle, first published on 14 October 1892. It contains the earliest short stories featuring the consulting detective Sherlock Holmes, which had been published in twelve monthly issues of The Strand Magazine from July 1891 to June 1892. The stories are collected in the same sequence, which is not supported by any fictional chronology. The only characters common to all twelve are Holmes and Dr. Watson and all are related in first-person narrative from Watson''s point of view.

Contains:
Scandal in Bohemia
Red-headed League
Case of Identity
Boscombe Valley Mystery
Five Orange Pips
Man with the Twisted Lip
Adventure of the Blue Carbuncle
Adventure of the Speckled Band
Adventure of the Engineer''s Thumb
Adventure of the Noble Bachelor
Adventure of the Beryl Coronet
Adventure of the Copper Beeches', 'Mystery', 'https://covers.openlibrary.org/b/id/6717853-L.jpg', 1892),
    ('OL476846W', 'The Red House Mystery', 'A. A. Milne', 'This is probably one of the top classics of "golden age" detective fiction. Anyone who''s read any mystery novels at all will be familiar with the tropes -- an English country house in the first half of the twentieth century, a locked room, a dead body, an amateur sleuth, a helpful sidekick, and all the rest.

It''s a clever story, ingenious enough in its way, and an iconic example of Agatha Christie / Dorothy Sayers -type murder mysteries. If you''ve read more than a few of those kinds of books, you might find this one a little predictable, but it''s fun despite that.

It''s particularly of note, however, because Raymond Chandler wrote about it extensively in his essay "The Simple Art of Murder." After praising it as "an agreeable book, light, amusing in the Punch style, written with a deceptive smoothness that is not as easy as it looks," he proceeds to take it sharply to task for its essential lack of realism. This book -- which Chandler admired to an extent -- was what he saw as the iconic example of what was wrong with the detective fiction of his day, and to which novels like "The Big Sleep" or "The Long Goodbye", with their hard-boiled, hard-hitting gumshoes and gritty realism, were a direct response.

So this book''s worth reading not just because it''s "an agreeable book, light, [and] amusing in the Punch style", but also because reading it will give a deepened appreciation for the later, more realistic detective fiction of writers like Hammett and Chandler.', 'Mystery', 'https://covers.openlibrary.org/b/id/6299936-L.jpg', 1922),
    ('OL472073W', 'Murder on the Links', 'Agatha Christie', 'Belgian detective Hercule Poirot is summoned to France after receiving a distressing letter with a urgent cry for help. Upon his arrival in Merlinville-sur-Mer, the investigator finds the man who penned the letter, the South American millionaire Monsieur Renauld, stabbed to death and his body flung into a freshly dug open grave on the golf course adjoining the property. Meanwhile the millionaire''s wife is found bound and gagged in her room. Apparently, it seems that Renauld and his wife were victims of a failed break-in, resulting in Renauld''s kidnapping and death.

There''s no lack of suspects: his wife, whose dagger served as the weapon; his embittered son, who would have killed for independence; and his mistress, who refused to be ignored - and each felt deserving of the dead man''s fortune. The police think they''ve found the cumprit. But Poirot has his doubts. Why is the dead man wearing an overcoat that is too big for him? And who was the impassioned love-letter in the pocket for? Before Poirot can answer these questions, the case is turned upside down by the discovery of a second, identically murdered corpse...', 'Mystery', 'https://covers.openlibrary.org/b/id/14582832-L.jpg', 1923),
    ('OL34330474W', 'Suicide Med', 'Freida McFadden', 'Nobody wants to go to a school nicknamed Suicide Med.

*One suicide. Every year.*

Heather McKinley has always dreamed of becoming a doctor. She doesn’t even care about her medical school’s grisly history of suicides—it can’t happen to her. But **after Heather’s longtime boyfriend dumps her and she finds herself failing anatomy, her world starts to crumble**.

The pressure is intense. People crack.

Thank goodness for Dr. Conlon, her quirky but beloved anatomy professor. He’ll do anything to help his students succeed. But **is it a coincidence that the bespectacled professor joined the staff the same year the suicides began?**

Or are they suicides at all?

All Heather knows is that **one student will die this year**.

And that student could be her.', 'Mystery', 'https://covers.openlibrary.org/b/id/13470475-L.jpg', 2014),
    ('OL471664W', 'The Sittaford Mystery', 'Agatha Christie', 'M-U-R-D-E-R. It began as an innocent parlor game intended to while away the hours on a bitter winter night.

But the message that appeared before the amateur occultists at the snowbound Sittaford House was spelled out as loud and clear as a scream. Of course, the notion that they had foretold doom was pure bunk. Wasn''t it? And the discovery of a corpse was pure coincidence. Wasn''t it? If they''re to discover the answer to this baffling murder, perhaps they should play again. But a journey into the spirit world could prove terribly dangerous-especially when the killer is lurking in this one.

NOTE: This book is the same as The Sittaford Mystery', 'Mystery', 'https://covers.openlibrary.org/b/id/13151831-L.jpg', 1931),
    ('OL16239762W', 'Gone Girl', 'Gillian Flynn', 'Gone Girl is a 2012 crime thriller novel by American writer Gillian Flynn. It was published by Crown Publishing Group in June 2012. The novel became popular and made the New York Times Best Seller list. The sense of suspense in the novel comes from whether or not Nick Dunne is involved in the disappearance of his wife Amy.', 'Mystery', 'https://covers.openlibrary.org/b/id/8368314-L.jpg', 2011),
    ('OL262463W', 'Memoirs of Sherlock Holmes [11 stories]', 'Arthur Conan Doyle', 'Contains:

Silver Blaze
Adventure of the Yellow Face
Stock-Broker''s Clerk
Adventure of the Gloria Scott
Adventure of the Musgrave Ritual
Adventure of the Reigate Squire
Crooked Man
Adventure of the Resident Patient
Adventure of the Greek interpreter
Naval Treaty
Final Problem', 'Mystery', 'https://covers.openlibrary.org/b/id/9246429-L.jpg', 1893),
    ('OL48035W', 'One for the Money', 'Janet Evanovich', 'Welcome to Trenton, New Jersey, home to wiseguys, average Joes, and Stephanie Plum, who sports a big attitude and even bigger money problems (since losing her job as a lingerie buyer for a department store). Stephanie needs cash--fast--but times are tough, and soon she''s forced to turn to the last resort of the truly desperate: family.

Stephanie lands a gig at her sleazy cousin Vinnie''s bail bonding company. She''s got no experience. But that doesn''t matter. Neither does the fact that the bail jumper in question is local vice cop Joe Morelli. From the time he first looked up her dress to the time he first got into her pants to the time Steph hit him with her father''s Buick, M-o-r-e-l-l-i has spelled t-r-o-u-b-l-e. And now the hot guy is in hot water--wanted for murder.', 'Mystery', 'https://covers.openlibrary.org/b/id/14361811-L.jpg', 1994),
    ('OL2234917W', 'Whose Body?', 'Dorothy L. Sayers', 'The first of the Lord Peter Wimsey mysteries, in which the suave and witty gentleman foregoes a rare-book auction to investigate the presence of a bespectacled nude body in an architect''s bathtub near the Wimsey''s Denver estate', 'Mystery', 'https://covers.openlibrary.org/b/id/8311819-L.jpg', 1923),
    ('OL471784W', 'The Seven Dials Mystery', 'Agatha Christie', 'Brings back several characters from an earlier novel, *The Secret of Chimneys*, in a story that can best be described as a John Buchan thriller told by P.G. Wodehouse. (https://agathachristie.fandom.com/wiki/The_Seven_Dials_Mystery)

Consummate young silly ass Gerry Wade is the despair of hosts and hostesses across the land, with his inability to make it to breakfast before the eggs are congealed, the toast has wilted and the coffee has grown chill and distinctly unwelcoming. And so, a small group of sundry other young silly-asses and interchangeable girls decide that a good, stiff dose of eight fine alarum clocks would be just the thing to spring him, yelling, from his bed in the early hours. This plan, however, fails signally to work, for the very good reason that Gerry is far too dead to be roused by anything quieter than the Last Trump.
This discovery both puts a dampener on the house party and raises some questions. Why would a notoriously heavy sleeper die of an overdose of a sleeping draught? And why are there only seven of the eight clocks found in the bedroom, neatly and sinisterly arranged on the mantelpiece as though to convey some message?
Lady Eileen ‘Bundle’ Brent and friends are shortly to find out… (https://alackofconsensus.wordpress.com/2018/03/07/review-the-seven-dials-mystery-by-agatha-christie/)', 'Mystery', 'https://covers.openlibrary.org/b/id/14575632-L.jpg', 1920),
    ('OL262496W', 'A Study in Scarlet', 'Arthur Conan Doyle', 'A Study in Scarlet is an 1887 detective novel by British writer Arthur Conan Doyle. The story marks the first appearance of Sherlock Holmes and Dr. Watson, who would become the most famous detective duo in literature.', 'Mystery', 'https://covers.openlibrary.org/b/id/13405534-L.jpg', 1887),
    ('OL472508W', 'Endless Night', 'Agatha Christie', 'Gipsy''s Acre is a truly beautiful upland site with views out to sea and, for Michael Rogers, it stirs a child-like fantasy. He wants to settle there, amongst the dark fir trees. Yet, as he leaves the village, a shadow of menace hangs over the land. This is the place where accidents happen. Perhaps Michael should have heeded the locals'' warnings: "There''s no luck for them as meddles with Gipsy''s Acre."The novel was adapted for the screen and released in 1972. It starred Hayley Mills and Britt Eklund. Agatha Christie was unhappy with the attempt to enliven the plot by infusing the movie with sexual scenes. Both Christie and her husband claim in their respective autobiographies that the novel is among their favorites due to the "twisted" character who had a chance of turning good but instead chose evil. The book is dedicated to the author''s relative Nora Prichard, who first told the author about a field called ''Gipsy''s Acres'' on the Welsh moors. The title of the novel is drawn from the Romantic poet William Blake''s Auguries of Innocence, of which a key line is ''Some are born to Endless Night''.', 'Mystery', 'https://covers.openlibrary.org/b/id/12855084-L.jpg', 1905),
    ('OL471738W', 'Destination Unknown', 'Agatha Christie', 'Hilary Craven has lost the will to live, Mrs Betterton is already dead. Then Hilary is asked to impersonate the dead woman and to trace her husband - a missing nuclear scientist - and her will to live returns. A faked air disaster, a string of radio-active pearls, a leper colony floundering in the dry heat of the Moroccan desert. Hilary is lead towards a terrifying discovery and her new found enthusiasm for life turns into ice-cold fear...Christie based this book partly on the activities of two famous physicists of the early 1950s: Bruno Ponecorvo, who defected to Russia, and Emil Fuchs, who spied for the Russians. It is another of Christie''s light-hearted thriller novels featuring a daring and fearless heroine.', 'Mystery', 'https://covers.openlibrary.org/b/id/6487762-L.jpg', 1954),
    ('OL1000821W', 'Die Softly', 'Christopher Pike', 'HE MAY HAVE PHOTOGRAPHED A MURDER.

Herb just wanted to photograph the cheerleaders in the school showers. He planted his camera high in the corner where no one could see it, and rigged it to a special homemade timer. He did that Thursday night, and he hoped that by Friday night he would have an exciting roll of film to develop.
But a girl dies Friday afternoon. On the surface it appears to be nothing more than a tragic car accident. But when Herb finally does collect his roll of film, he develops a picture that shows a shadowy figure sneaking up on the girl who has died -- sneaking up on her with a baseball bat.
It makes Herb wonder if the girl was dead long before the car accident.
But unfortunately for Herb, he doesn''t wonder if the murderer knows he took the picture.', 'Mystery', 'https://covers.openlibrary.org/b/id/2394997-L.jpg', 1991),
    ('OL25337698W', 'Hidden Pictures', 'Jason Rekulak', 'Mallory is delighted to have a new job looking after gorgeous four-year-old, Teddy. She''s been sober for a year and a half and she''s sure her new nannying role in the affluent suburbs will help keep her on the straight and narrow.

That is until Teddy starts to draw disturbing pictures of his imaginary friend, Anya. It is quite clear to Mallory and to Teddy''s parents, even in his crude childlike style, that the woman Teddy is drawing in his pictures is dead.

Teddy''s crayons are confiscated, and his paper locked away. But the drawings somehow keep coming, telling a frightening story of a woman murdered... and they''re getting more sophisticated. But if Teddy isn''t drawing the pictures anymore, who is? And what are they trying to tell Mallory about her new home?', 'Mystery', 'https://covers.openlibrary.org/b/id/12775985-L.jpg', 2022),
    ('OL471667W', 'Appointment with Death', 'Agatha Christie', 'Agatha Christie set this book in Jerusalem. An english family headed by a bullying overbearing mother is murdered. Suspicion falls on members of the family, so Poirot steps in to investigate.', 'Mystery', 'https://covers.openlibrary.org/b/id/14561660-L.jpg', 1938),
    ('OL472388W', 'Why Didn''t they Ask Evans?', 'Agatha Christie', 'It started when a false step from a misty footpath sent a mysterious stranger plummeting to his death. How was Bobby Jones to know that witnessing the dying man''s last words--"Why didn''t they ask Evans?"--would send him on a death-defying chase? Bobby and his unlikely partner in detection, Lady Frances Derwent, end up in pursuit of a hauntingly beautiful woman--and a cunning killer who is out to do them in!

This description comes from the 1984 Berkley edition.', 'Mystery', 'https://covers.openlibrary.org/b/id/9831097-L.jpg', 1934),
    ('OL471670W', 'The Clocks', 'Agatha Christie', 'Sheila Webb, typist-for-hire, has arrived at 19 Wilbraham Crescent in the seaside town of Crowdean to accept a new job. What she finds is a well-dressed corpse surrounded by five clocks. Mrs Pebmarsh, the blind owner of No. 19, denies all knowledge of ringing Sheila’s secretarial agency and asking for her by name — yet someone did. Nor does she own that many clocks. And neither woman seems to know the victim. Colin Lamb, a young intelligence specialist working a case of his own at the nearby naval yard, happens to be on the scene at the time of Sheila Webb’s ghastly discovery. Lamb knows of only one man who can properly investigate a crime as bizarre and baffling as what happened inside No. 19 — his friend and mentor, Hercule Poirot.', 'Mystery', 'https://covers.openlibrary.org/b/id/12996554-L.jpg', 1963),
    ('OL472049W', 'Evil Under the Sun', 'Agatha Christie', 'Set at the Jolly Roger, a posh vacation resort for the rich and famous on the southern coast of England, Evil Under the Sun is one of Agatha Christie’s most intriguing mysteries. When a gorgeous young bride is brutally strangled to death on the beach, only Hercule Poirot can sift through the secrets that shroud each of the guests and unravel the macabre mystery at this playground by the sea.', 'Mystery', 'https://covers.openlibrary.org/b/id/13671433-L.jpg', 1941),
    ('OL167179W', 'The Big Bad Wolf', 'James Patterson', 'Alex Cross''s first case since joining the FBI has his new colleagues stymied. Across the country, beautiful women are being kidnapped-to be bought and sold as slaves. Behind this depraved scheme stands a shadowy figure known only as The Wolf, a master criminal who has brought a new reign of terror to organized crime. With Alex''s personal life in chaos because of his ex-fiancee''s return and with the FBI''s caution testing his patience, Alex has to go out on his own. For to stalk a ruthless predator without a name or a face, Alex Cross must become a lone wolf himself...', 'Mystery', 'https://covers.openlibrary.org/b/id/189358-L.jpg', 2001),
    ('OL471789W', 'The Secret Adversary', 'Agatha Christie', 'Tommy Beresford and Prudence ''Tuppence'' Cowley are young, in love… and flat broke. Just after Great War, there are few jobs available and the couple are desperately short of money. Restless for excitement, they decide to embark on a daring business scheme: Young Adventurers Ltd.—"willing to do anything, go anywhere." Hiring themselves out proves to be a smart move for the couple. In their first assignment for the mysterious Mr. Whittingtont, all Tuppence has to do in their first job is take an all-expense paid trip to Paris and pose as an American named Jane Finn. But with the assignment comes a bribe to keep quiet, a threat to her life, and the disappearance of her new employer. Now their newest job are playing detective.

Where is the real Jane Finn? The mere mention of her name produces a very strange reaction all over London. So strange, in fact, that they decided to find this mysterious missing lady. She has been missing for five years. And neither her body nor the secret documents she was carrying have ever been found. Now post-war England''s economic recovery depends on finding her and getting the papers back. But he two young working undercover for the British ministry know only that her name and the only photo of her is in the hands of her rich American cousin. It isn’t long before they find themselves plunged into more danger than they ever could have imagined—a danger that could put an abrupt end to their business… and their lives.', 'Mystery', 'https://covers.openlibrary.org/b/id/14590159-L.jpg', 1922),
    ('OL24390422W', 'Twisted Love', 'Ana Huang', 'He has a heart of ice … but for her, he''d burn the world. Alex Volkov is a devil blessed with the face of an angel and cursed with a past he can''t escape. Driven by a tragedy that has haunted him for most of his life, his ruthless pursuits for success and vengeance leave little room for matters of the heart. But when he''s forced to look after his best friend''s sister, he starts to feel something in his chest: A crack. A melt. A fire that could end his world as he knew it.

Ava Chen is a free spirit trapped by nightmares of a childhood she can''t remember. But despite her broken past, she''s never stopped seeing the beauty in the world … including the heart beneath the icy exterior of a man she shouldn''t want. Her brother''s best friend. Her neighbor. Her savior and her downfall. Theirs is a love that was never supposed to happen - but when it does, it unleashes secrets that could destroy them both … and everything they hold dear. Twisted Love is a brother''s best friend/opposites attract romance with a hint of suspense. It''s book one in the Twisted series, but can be read as a standalone. WARNING: This book contains a possessive alpha/antihero, explicit sexual content, and profanity. No cheating or ménage, but if you''re looking for a traditionally sweet, loveable hero, this is not the book for you. Recommended for 18+.', 'Romance', 'https://covers.openlibrary.org/b/id/12940491-L.jpg', 2021),
    ('OL25515697W', 'Twisted Games', 'Ana Huang', 'She can never be his…but he’s taking her anyway.

Stoic, broody, and arrogant, elite bodyguard Rhys Larsen has two rules: 1) Protect his clients at all costs 2) Do not become emotionally involved. Ever.

He has never once been tempted to break those rules…until her.

Bridget von Ascheberg. A princess with a stubborn streak that matches his own and a hidden fire that reduces his rules to ash. She’s nothing he expected and everything he never knew he needed.

Day by day, inch by inch, she breaks down his defenses until he’s faced with a truth he can no longer deny: he swore an oath to protect her, but all he wants is to ruin her. Take her.

Because she’s his.

His princess.

His forbidden fruit.

His every depraved fantasy.

***

Regal, strong-willed, and bound by the chains of duty, Princess Bridget dreams of the freedom to live and love as she chooses.

But when her brother abdicates, she’s suddenly faced with the prospect of a loveless, politically expedient marriage and a throne she never wanted.

And as she navigates the intricacies—and treacheries—of her new role, she must also hide her desire for a man she can’t have.

Her bodyguard.

Her protector.

Her ultimate ruin.


Unexpected and forbidden, theirs is a love that could destroy a kingdom…and doom them both.


Twisted Games is a contemporary royal bodyguard romance. It’s book two of the Twisted series but can be read as a standalone.

Warning: This book contains a possessive hero, explicit content, and profanity.', 'Romance', 'https://covers.openlibrary.org/b/id/12821465-L.jpg', 2021),
    ('OL27245843W', 'Twisted Hate', 'Ana Huang', 'He hates her...almost as much as he wants her.

Gorgeous, cocky, and fast on his way to becoming a hotshot doctor, Josh Chen has never met a woman he couldn’t charm—except for Jules f**king Ambrose.

The beautiful redhead has been a thorn in his side since they met, but she also consumes his thoughts in a way no woman ever has.

When their animosity explodes into one unforgettable night, he proposes a solution that’ll get her out of his system once and for all: an enemies with benefits arrangement with simple rules.

No jealousy.

No strings attached.

And absolutely no falling in love.

**

Outgoing and ambitious, Jules Ambrose is a former party girl who’s focused on one thing: passing the attorney’s bar exam.

The last thing she needs is to get involved with a doctor who puts the SUFFER in insufferable…no matter how good-looking he is.

But the more she gets to know him, the more she realizes there’s more than meets the eye to the man she’s hated for so long.

Her best friend’s brother.

Her nemesis.

And her only salvation.

Theirs is a match made in hell, and when the demons from their past catch up with them, they’re faced with truths that could either save them …or destroy everything they’ve worked for.

Twisted Hate is a steamy enemies with benefits/enemies to lovers romance. It''s book three in the Twisted series but can be read as a standalone.

Warning: The story contains explicit content, mild violence, profanity, and topics that may be sensitive to some readers. Detailed list linked inside the book. Recommended for 18+.', 'Romance', 'https://covers.openlibrary.org/b/id/12928487-L.jpg', 2022),
    ('OL42430111W', 'The Deal', 'Elle Kennedy', 'The international bestseller! A standalone novel* from New York Times and international bestselling author Elle Kennedy!

She’s about to make a deal with the college bad boy…

Hannah Wells has finally found someone who turns her on. But while she might be confident in every other area of her life, she’s carting around a full set of baggage when it comes to sex and seduction. If she wants to get her crush’s attention, she’ll have to step out of her comfort zone and make him take notice…even if it means tutoring the annoying, childish, cocky captain of the hockey team in exchange for a pretend date.

...and it’s going to be oh so good

All Garrett Graham has ever wanted is to play professional hockey after graduation, but his plummeting GPA is threatening everything he’s worked so hard for. If helping a sarcastic brunette make another guy jealous will help him secure his position on the team, he’s all for it. But when one unexpected kiss leads to the wildest sex of both their lives, it doesn’t take long for Garrett to realize that pretend isn’t going to cut it. Now he just has to convince Hannah that the man she wants looks a lot like him.', 'Romance', 'https://covers.openlibrary.org/b/id/10201611-L.jpg', 2000),
    ('OL35223328W', 'Married at first sight', 'Gu Lingfei', NULL, 'Romance', 'https://covers.openlibrary.org/b/id/14312142-L.jpg', 2015),
    ('OL20893778W', 'Corrupt', 'Penelope Douglas', 'Dreams are desires of the heart; Nightmares, my obsession.
Erika
When I have it close to me, I tremble. Of fear and desire.

Michael Crist, my ex-boyfriend''s older brother, is like one of those movies that, even though it''s scary, you can''t stop watching. Handsome, strong, and intimidating, I''ve watched him for years, wishing I was closer to see if what is said about him is true. He''s the star of his university''s basketball team, he''d never noticed me and he''d barely looked at me... Until now. He''s got something on his mind, I can feel it, I can almost taste it but, knowing everything I know, do I really want to find out what he has planned?

Michael
I want to get revenge. Almost as much as owning it.

Her name is Erika Fane, but everyone calls her Rika. You could say he grew up in my house, he''s always been around. She looks away when I walk into a room and stays still when I''m around. I can feel the tension he gives off, his desire for more; I don''t have his body but I know I''ve caught his mind. And now, the opportunity to avenge what happened a few years ago is too good to be true. I''ve been patient. I''ve waited for the moment. Every last of your nightmares will come true.

When passion and danger mix, anything can happen.', 'Romance', 'https://covers.openlibrary.org/b/id/10226443-L.jpg', 2015),
    ('OL20808172W', 'Punk 57', 'Penelope Douglas', '"We were perfect together. Until we met."

Misha

I can’t help but smile at the words in her letter. She misses me.

In fifth grade, my teacher set us up with pen pals from a different school. Thinking I was a girl, with a name like Misha, the other teacher paired me up with her student, Ryen. My teacher, believing Ryen was a boy like me, agreed.

It didn’t take long for us to figure out the mistake. And in no time at all, we were arguing about everything. The best take-out pizza. Android vs. iPhone. Whether or not Eminem is the greatest rapper ever…

And that was the start. For the next seven years, it was us.

Her letters are always on black paper with silver writing. Sometimes there’s one a week or three in a day, but I need them. She’s the only one who keeps me on track, talks me down, and accepts everything I am.

We only had three rules. No social media, no phone numbers, no pictures. We had a good thing going. Why ruin it?

Until I run across a photo of a girl online. Name’s Ryen, loves Gallo’s pizza, and worships her iPhone. What are the chances?

F*ck it. I need to meet her.

I just don’t expect to hate what I find.

Ryen

He hasn’t written in three months. Something’s wrong. Did he die? Get arrested? Knowing Misha, neither would be a stretch.

Without him around, I’m going crazy. I need to know someone is listening. It’s my own fault. I should''ve gotten his number or picture or something.

He could be gone forever.

Or right under my nose, and I wouldn’t even know it.', 'Romance', 'https://covers.openlibrary.org/b/id/10107803-L.jpg', 2016),
    ('OL24314065W', 'The Sweetest Oblivion', 'Danielle Lori', 'She’s a romantic at heart, living in the most unromantic of worlds . . .Nicknamed Sweet Abelli for her docile nature, Elena smiles on cue and has a charming response for everything. She’s the favored daughter, the perfect mafia principessa . . . or was.Now, all she can see in the mirror’s reflection is blood staining her hands like crimson paint.They say first impressions are everything . . .In the murky waters of New York’s underworld, Elena’s sister is arranged to marry Nicolas Russo. A Made Man, a boss, a cheat—even measured against mafia standards. His reputation stretches far and wide and is darker than his black suits and ties. After his and Elena’s first encounter ends with an accidental glare on her part, she realizes he’s just as rude as he is handsome.She doesn’t like the man or anything he stands for, though that doesn’t stop her heart from pattering like rain against glass when he’s near, nor the shiver that ghosts down her spine at the sound of his voice.And he’s always near. Telling her what to do. Making her feel hotter than any future brother-in-law should. Elena may be the Sweet Abelli on the outside, but she’s beginning to learn she has a taste for the darkness, for rough hands, cigarettes, and whiskey-colored eyes. Having already escaped one scandal, however, she can hardly afford to be swept up in another.Besides, even if he were hers, everyone knows you don’t fall in love with a Made Man . . . right?This is a standalone forbidden romance.', 'Romance', 'https://covers.openlibrary.org/b/id/10831263-L.jpg', 2018),
    ('OL27733867W', 'It Starts with Us', 'Colleen Hoover', '**Before It Ends with Us, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (USA TODAY) #1 New York Times bestseller It Ends with Us.**

Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.

But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.

Switching between the perspectives of Lily and Atlas, It Starts with Us picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of Perfect Neighbors) bestselling phenomenon It Ends with Us left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, New York Times bestselling author).', 'Romance', 'https://covers.openlibrary.org/b/id/12749873-L.jpg', 2022),
    ('OL18020194W', 'It Ends With Us', 'Colleen Hoover', 'Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.

Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.

As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.

With this bold and deeply personal novel, It Ends With Us is a heart-wrenching story and an unforgettable tale of love that comes at the ultimate price.', 'Romance', 'https://covers.openlibrary.org/b/id/10473609-L.jpg', 2012),
    ('OL27818823W', 'Twisted Lies', 'Ana Huang', 'He''ll do anything to have her...including lie.

Charming, deadly, and smart enough to hide it, Christian Harper is a monster dressed in the perfectly tailored suits of a gentleman.

He has little use for morals and even less use for love, but he can’t deny the strange pull he feels toward the woman living just one floor below him.

She’s the object of his darkest desires, the only puzzle he can’t solve. And when the opportunity to get closer to her arises, he breaks his own rules to offer her a deal she can’t refuse.

Every monster has their weakness. She’s his.

His obsession.

His addiction.

His only exception.', 'Romance', 'https://covers.openlibrary.org/b/id/14425197-L.jpg', 2022),
    ('OL25434351W', 'Heated Rivalry', 'Rachel Reid', 'Pro hockey star Shane Hollander isn’t just crazy talented, he’s got a spotless reputation. Hockey is his life. Now that he’s captain of the Montreal Voyageurs, he won’t let anything jeopardize that, especially the sexy Russian whose hard body keeps him awake at night.

Boston Bears captain Ilya Rozanov is everything Shane’s not. The self-proclaimed king of the ice, he’s as cocky as he is talented. No one can beat him—except Shane. They’ve made a career on their legendary rivalry, but when the skates come off, the heat between them is undeniable. When Ilya realizes he wants more than a few secret hookups, he knows he must walk away. The risk is too great.

As their attraction intensifies, they struggle to keep their relationship out of the public eye. If the truth comes out, it could ruin them both. But when their need for each other rivals their ambition on the ice, secrecy is no longer an option…', 'Romance', 'https://covers.openlibrary.org/b/id/15226452-L.jpg', 2019),
    ('OL26201864W', 'The Fine Print', 'Lauren Asher', 'Rowan
I’m in the business of creating fairy tales.
Theme parks. Production companies. Five-star hotels.
Everything could be all mine if I renovated Dreamland.
My initial idea of hiring Zahra was good in theory, but then I kissed her.
Things spiraled out of control once I texted her using an alias.
By the time I realized where I went wrong, it was too late.
People like me don’t get happy endings.
Not when we’re destined to ruin them.

Zahra
After submitting a drunk proposal criticizing Dreamland’s most expensive ride, I should have been fired.
Instead, Rowan Kane offered me a dream job.
The catch? I had to work for the most difficult boss I’d ever met.
Rowan was rude and completely off-limits, but my heart didn’t care.
At least not until I discovered his secret.
It was time to teach the billionaire that money couldn’t fix everything.
Especially not us.', 'Romance', 'https://covers.openlibrary.org/b/id/14319054-L.jpg', 2021),
    ('OL20018811W', 'November 9', 'Colleen Hoover', '"Beloved #1 New York Times bestselling author Colleen Hoover returns with an unforgettable love story between a writer and his unexpected muse. 

Fallon meets Ben, an aspiring novelist, the day before her scheduled cross-country move. Their untimely attraction leads them to spend Fallon''s last day in L.A. together, and her eventful life becomes the creative inspiration Ben has always sought for his novel. Over time and amidst the various relationships and tribulations of their own separate lives, they continue to meet on the same date every year. Until one day Fallon becomes unsure if Ben has been telling her the truth or fabricating a perfect reality for the sake of the ultimate plot twist. Can Ben''s relationship with Fallon and simultaneously his novel be considered a love story if it ends in heartbreak?"--

Fallon meets Ben, an aspiring novelist, the day before her scheduled cross-country move. They spend Fallon''s last day in L.A. together, and her eventful life becomes the creative inspiration Ben has always sought for his novel. Amidst the various relationships and tribulations of their own separate lives they continue to meet on the same date every year. But has Ben has been telling her the truth... or fabricating a perfect reality for the sake of the ultimate plot twist?', 'Romance', 'https://covers.openlibrary.org/b/id/9219001-L.jpg', 2015),
    ('OL2959315W', 'Breaking Point', 'Emma Darcy', 'The honeymoon was over

Rafe had wanted Tanya the moment he saw her. When he proposed, she''d been deliciously happy--happy to give up her job without a second thought, and devote herself to decorating their beautiful new home in Sydney''s most prestigious neighborhood.

She hadn''t realized then that the only intimacy he wanted with her was in their bed. Rafe put business--including his cool blond personal assistant--first.

Tanya was not about to spend the rest of her life waiting for a man who thought another woman was more important than his wife. The honeymoon was over. The marriage was at the breaking point.', 'Romance', 'https://covers.openlibrary.org/b/id/10387434-L.jpg', 1992),
    ('OL20564687W', 'Hopeless', 'Colleen Hoover, Maialen Garagarza Urkia', 'Sky, a senior in high school, meets Dean Holder, a guy with a promiscuous reputation that rivals her own. From their very first encounter, he terrifies and captivates her. Something about him sparks memories of her deeply troubled past, a time she''s tried so hard to bury. Though Sky is determined to stay far away from him, his unwavering pursuit and enigmatic smile break down her defences and the intensity of the bond between them grows. But the mysterious Holder has been keeping secrets of his own, and once they are revealed, Sky is changed forever and her ability to trust may be a casualty of the truth.', 'Romance', 'https://covers.openlibrary.org/b/id/10549926-L.jpg', 2013),
    ('OL11327658W', 'Devil and the Deep Sea', 'Sara Craven', '"A year out of your life. What price would you ask?"

Samma supposed that any other woman would surely slap the face of a man who would pose such a question. But Samma couldn''t afford that luxury with Roche Delacroix.

With her stepfather ready to sell her "favors" to clear his gambling debts, Roche represented Samma''s only avenue of escape from an unthinkable future on Cristoforo Island.

Only a few hours earlier, the lips that opened the suggestive negotiation had made Samma so thoroughly aware of being female. Samma couldn''t help feeling that life was doubly unfair.', 'Romance', 'https://covers.openlibrary.org/b/id/9620545-L.jpg', 1988),
    ('OL11327957W', 'A Man Possessed', 'Penny Jordan', 'He''d rejected her once already.

A cruel fate brought Dominic Harland back into Kate Hammond''s life.

Eight years ago, in the midst of a bleak marriage, Kate had offered herself to Dominic only to be humiliatingly rejected. The pain had lingered, and after her husband''s death she''d vowed there would be no men in her life.

Kate was starting over—selling her house, starting a business—when Dominic reappeared, still hurting her, still desiring her. But as she began to understand him, Kate''s anger turned to love. And she was more afraid of Dominic than ever.', 'Romance', 'https://covers.openlibrary.org/b/id/8577643-L.jpg', 1986),
    ('OL21833211W', 'Priest', 'Sierra Simone', 'There are many rules a priest can''t break. A priest cannot marry. A priest cannot abandon his flock. A priest cannot forsake his God.

I''ve always been good at following rules.

Until she came. Then I learned new rules.

My name is Tyler Anselm Bell. I''m twenty-nine years old. Six months ago, I broke my vow of celibacy on the altar of my own church, and God help me, I would do it again.

I am a priest and this is my confession.', 'Romance', 'https://covers.openlibrary.org/b/id/10409469-L.jpg', 2015),
    ('OL1708087W', 'To Catch A Butterfly', 'Marjorie Lewty', 'Kate had always adored Cornwall, and when the wealthy business tycoon Damian St. Ewan offered her a job there for two months - despite the fact that she didn''t like tycoons in general and Damian St. Ewan in particular - she decided the opportunity was too good to miss. She had taken it for granted that the job in question was a secretarial one, so she was astounded when she arrived in Cornwall to learn that Damian had had something quite different in mind. It appeared that he wanted a temporary fiancee, to keep another woman at bay. And something told Kate that she would be playing with fire if she agreed . . .', 'Romance', 'https://covers.openlibrary.org/b/id/10599967-L.jpg', 1977),
    ('OL3759285W', 'Bought with His Name', 'Penny Jordan', 'To discourage him, Genista had deliberately let the arrogantly handsome Luke Ferguson believe that she was a promiscuous adventuress. She knew from experience the hurt a man could carelessly inflict on an innocent heart, and she realized how vulnerable she was to his brand of magnetism. Luke''s proposal of marriage was a shock, as was his method of asking. It sounded very much like blackmail, and in the circumstances she had no alternative but to accept.', 'Romance', 'https://covers.openlibrary.org/b/id/7248501-L.jpg', 1982),
    ('OL11327660W', 'The Marriage Deal', 'Sara Craven', 'Jago was the only possible solution

Ashley Landon was desperate. After two years of her best efforts as chairman, her family''s business faced either bankruptcy or a takeover. Then Jago Marrick, her ex-fiance, turned up with a hardheaded alternative--marriage.

Ashley''s first reaction was shock, but Jago seemed to be the company''s only hope. As her husband and the new chairman, Jago''s vast business experience could put Landons back on its feet.

Reluctantly Ashley accepted--only to find that he wanted much more from their marriage than she was prepared to give.

Mills & Boon

Ashley had put all thoughts of Jago Marrick behind her three years ago when he disillusioned her so totally about his motives for marrying her. She had grown a hard shell and learned how to fight her own battles in the business world and she was proud of her achievements. But now a problem faced her that she couldn''t conquer and it seemed that Jago was the only man prepared to help her - at a price. Every instinct told Ashley not to trust him. But had she really an alternative?', 'Romance', 'https://covers.openlibrary.org/b/id/10322881-L.jpg', 1986),
    ('OL29330646W', 'King of Pride', 'Ana Huang', 'She''s his opposite in every way...and the greatest temptation he''s ever known.
Reserved, controlled, and proper to a fault, Kai Young has neither the time nor inclination for chaos—and Isabella, with her purple hair and inappropriate jokes, is chaos personified.

With a crucial CEO vote looming and a media empire at stake, the billionaire heir can’t afford the distraction she brings.

Isabella is everything he shouldn’t want, but with every look and every touch, he’s tempted to break all his rules…and claim her as his own.

***

Bold, impulsive, and full of life, Isabella Valencia has never met a party she doesn’t like or a man she couldn’t charm...except for Kai Young.

It shouldn’t matter. He’s not her type—the man translates classics into Latin for fun, and his membership at the exclusive club where she bartends means he’s strictly off limits.

But she can’t deny that, beneath his cool exterior, is a man who could make her melt with just a touch.

No matter how hard they try, they can’t resist giving into their forbidden desires.

Even if it costs them everything.', 'Romance', 'https://covers.openlibrary.org/b/id/13244526-L.jpg', 2023),
    ('OL11277322W', 'Fever', 'Charlotte Lamb', 'Their worlds were light-years apart. Sara Nichols was proud to be a painter Her landscapes were catching on, and though she wasn''t making a fortune, she had enough to get by. Nick Rawdon, on the other hand, had more money than he bothered to count. Owner of a prestigious bank, he moved in glittering circles far beyond those Sara was used to. They seemed to have nothing in common--except a gripping physical attraction. But even that was based on Nick''s totally wrong idea of the kind of girl that Sara really was.', 'Romance', 'https://covers.openlibrary.org/b/id/6499323-L.jpg', 1979),
    ('OL28952677W', 'Icebreaker', 'Hannah Grace', '**A TikTok sensation! Sparks fly when a competitive figure skater and hockey team captain are forced to share a rink.**

Anastasia Allen has worked her entire life for a shot at Team USA. It looks like everything is going according to plan when she gets a full scholarship to the University of California, Maple Hills and lands a place on their competitive figure skating team.

Nothing will stand in her way, not even the captain of the hockey team, Nate Hawkins.

Nate is focus as team captain is on keeping his team on the ice. Which is tricky when a facilities mishap means they are forced to share a rink with the figure skating team including Anastasia, who clearly can''t stand him.

But when Anastasia''s skating partner faces an uncertain future, she may have to look to Nate to take her shot.

Sparks fly, but Anastasia isn''t worried because she could never like a hockey player, right?', 'Romance', 'https://covers.openlibrary.org/b/id/13180728-L.jpg', 2020),
    ('OL27838518W', 'From Blood and Ash', 'Jennifer L. Armentrout', 'A Maiden…

Chosen from birth to usher in a new era, Poppy’s life has never been her own. The life of the Maiden is solitary. Never to be touched. Never to be looked upon. Never to be spoken to. Never to experience pleasure. Waiting for the day of her Ascension, she would rather be with the guards, fighting back the evil that took her family, than preparing to be found worthy by the gods. But the choice has never been hers.

A Duty…

The entire kingdom’s future rests on Poppy’s shoulders, something she’s not even quite sure she wants for herself. Because a Maiden has a heart. And a soul. And longing. And when Hawke, a golden-eyed guard honor bound to ensure her Ascension, enters her life, destiny and duty become tangled with desire and need. He incites her anger, makes her question everything she believes in, and tempts her with the forbidden.

A Kingdom…

Forsaken by the gods and feared by mortals, a fallen kingdom is rising once more, determined to take back what they believe is theirs through violence and vengeance. And as the shadow of those cursed draws closer, the line between what is forbidden and what is right becomes blurred. Poppy is not only on the verge of losing her heart and being found unworthy by the gods, but also her life when every blood-soaked thread that holds her world together begins to unravel.', 'Romance', 'https://covers.openlibrary.org/b/id/14105538-L.jpg', 2020),
    ('OL3775449W', 'Taggart''s Woman', 'Carole Mortimer', 'She married into turbulence

To inherit her rightful share of the family airline business, Heather Danvers, 21, was forced to marry her late father''s partner--Daniel Taggart, a rough-edged, self-made millionaire whose contempt for her was obvious.

In the two years since they''d first met, Heather''s love had soared to dizzying heights while 34 year old Daniel''s feelings had stayed in a holding pattern of indifference.

The thought of sleeping with Daniel now seemed to Heather a little like hell--and heaven! Would true love be forever on standby?', 'Romance', 'https://covers.openlibrary.org/b/id/9530489-L.jpg', 1987),
    ('OL11327987W', 'Falcon''s Prey', 'Penny Jordan', 'Desert Bride. Felicia accepted there would be hurdles to overcome when she agreed to accompany her fiance, Faisal, to his homeland: she was ordinary English girl, and he was an Arab from a immensely wealthy family. But there was one particular problem she hadn''t bargained for- Faisal''s uncle, Sheikh Raschid al Hamid al Sabah. It wasn''t just Raschid''s mistaken conviction that Felicia was an unprincipled gold digger that was causing her alarm. It was the slowly awakening realization that she might have become engaged to the wrong man....', 'Romance', 'https://covers.openlibrary.org/b/id/6460263-L.jpg', 1981),
    ('OL4215998W', 'To Speak of Love', 'Claudia Jameson', 'Chelsea had to grow into love.

Neglected by her parents, Chelsea Prescott was a rebellious, insecure teenager when she''d first met Ricardo Colchero at his family home in Madrid. "Be careful about what you want, nina," the dark eyed banker had warned gently, "because that''s surely what you''ll get."

Finishing school and a year of traveling had transformed Chelsea from an awkward girl to a beautiful woman. Suddenly her easy relationship with Ricardo was complicated by a new and powerful attraction.

Ricardo''s intentions were clear. He wanted Chelsea. But only if she was free and ready to choose love for itself.', 'Romance', 'https://covers.openlibrary.org/b/id/8577635-L.jpg', 1986),
    ('OL3775397W', 'Uncertain Destiny', 'Carole Mortimer', '"Can''t you see how much loving someone hurts?"

Justin de Wolfe''s words were prophetic for Caroline Maxwell. Drawn to Justin by a fierce mutual passion, the usually sensible Caroline married him knowing that he couldn''t love her, just as she couldn''t help loving him.

She accepted the hazards of marriage to the arrogant, magnetic lawyer. But Justin''s reaction to Caroline''s eager announcement of her pregnancy shocked her to the core.

So many things about Justin needed an explanation; his aversion to love, his sudden changes of mood and the woman from his past whose name he cried out in his sleep. Her, most of all.', 'Romance', 'https://covers.openlibrary.org/b/id/15084828-L.jpg', 1988),
    ('OL28181491W', 'God of Malice', 'Rina Kent', 'From USA Today bestselling author Rina Kent comes a new STANDALONE dark romance about a villain and his new obsession.


I caught the attention of a monster.
I didn''t ask for it.
Didn''t even see it coming.
But the moment I do, it''s too late.
Killian Carson is a predator wrapped in sophisticated charm.
He''s cold-blooded, manipulative, and savage.
The worst part is that no one sees his devil side.
I do.
And that will cost me everything.
I run, but the thing about monsters?
They always chase.', 'Romance', 'https://covers.openlibrary.org/b/id/13291765-L.jpg', 2022),
    ('OL4342701W', 'Confirmed bachelor', 'Roberta Leigh', 'Her assignment was glamorous but tough.

The man Robyn was sent to work with was the disreputable playboy author, Bradley Dexter--a man whose scandalous life-style and cynical attitude she despised.

However, Robyn wasn''t easily deterred. She ignored the noisy parties and exotic women at Brad''s villa and set determinedly to work.

Making Bradley concentrate on his manuscript required the most devious tactics--and Robyn pretended to be as jaded as he was. But falling in love with this outrageous man was never part of her plan!', 'Romance', 'https://covers.openlibrary.org/b/id/7393889-L.jpg', 1981),
    ('OL6794523W', 'Temporary Bride', 'Patricia Wilson', 'It was a terrible choice for her. Yet Kit Landor was as implacable as his piercing blue eyes when he told Charlotte, "You''ll marry me or Uncle Joe gets what''s coming to him." Charlotte couldn''t let her beloved uncle go to prison. Besides, Kit was too attractive for his own good, and Charlotte was not immune to his charms. But she wasn''t going to let him have things all his own way. Why should she--especially when he really wanted the glamorous Veronica.', 'Romance', 'https://covers.openlibrary.org/b/id/6888427-L.jpg', 1988),
    ('OL3457830W', 'Not Once But Twice', 'Betty Neels', 'Dr. Duert ter Brandt disapproved of Christina''s relationship with his brother Adam, and he made sure they both knew it. True, he didn''t stop Chrissy from coming to Holland to work near Adam. Still, he made it clear that her infatuation was not in the best interest of his hospital. But maybe he had other --hidden-- reasons for hoping that Chrissy would give up her notion of love at first sight…..', 'Romance', 'https://covers.openlibrary.org/b/id/2410565-L.jpg', 1981),
    ('OL11277304W', 'Out of Control', 'Charlotte Lamb', 'No man would get close to her again! 

The scars of an adolescent indiscretion were still so raw that Liza kept her heart uninvolved in any relationships. A modeling career and business had given her material success and peace of mind. 

Then she collided with G. K. Gifford outside her Essex cottage and poof - there went her hard-won serenity. For this wealthy man had crashed into her life to break up his nephew''s friendship with a "gold digger" and the chemistry between them had flared.', 'Romance', 'https://covers.openlibrary.org/b/id/9242841-L.jpg', 1987),
    ('OL11327979W', 'Without Trust', 'Penny Jordan', 'She had been hurt too many times

 Accused by a malicious cousin of committing a scandalous crime, Lark Cummings, 22, was devastated. And, in the British courts, the prosecutor, ruthless James Wolfe, showed her no mercy.

 Then, incredibly, the case was dropped. And--out of the blue--impoverished Lark was offered an ideal job by a rich widow. She gladly accepted--unaware that disconcerting James Wolfe, 30, was her employer''s enigmatic son.

 With James''s reappearance in her life, Lark feared the powerful currents pulsing between them. She couldn''t bear to risk her trust. Not to the man who''d once treated her so callously.', 'Romance', 'https://covers.openlibrary.org/b/id/6695537-L.jpg', 1988),
    ('OL3770466W', 'Betrayal in Bali', 'Sally Wentworth', 'Gael had easily been won by Leo Kane''s handsome looks and savoir faire. She eagerly accepted his marriage proposal and looked forward to the adventure of living in Indonesia.

But her bridal hopes were quickly shattered when she discovered Leo had staged their marriage for revenge. He wanted to make her pay for a wrongdoing he thought she''d committed.

Unfortunately, Gael couldn''t prove her innocence. All she wanted to do was escape the husband she now despised. She must find a way to avoid being part of his crazy scheme!', 'Romance', 'https://covers.openlibrary.org/b/id/7304574-L.jpg', 1980),
    ('OL11327666W', 'A High Price to Pay', 'Sara Craven', 'What choice did she really have?

Alison Mortimer had felt there was something going on over and above the appalling reality of her father''s sudden death. And Nicholas Bristow''s presence confirmed her suspicions.

Her father, she discovered, had lost everything in an attempt to save his business. Even Ladymead, the family home, had gone as security for loans. But 32 year old Nicholas Bristow, her father''s lender, had not come to evict them.

The terms of settlement Nicholas offered took into account Ally''s concern for her sister''s future and her mother''s peace of mind. At the price of their happiness, Ally could hardly refuse to marry him!', 'Romance', 'https://covers.openlibrary.org/b/id/9145110-L.jpg', 1986),
    ('OL3771321W', 'Season of Mists', 'Anne Mather', '"Our marriage was a farce," Piers said. 

 Abby couldn''t deny Piers''s statement. Time had certainly proven that true, but the young Abby had loved him with all the passion within her. 

 At that time she could not have foreseen the awful events that had led him to deny his own son. Abby had done the only thing possible, she''d fled. 

 For twelve years she thought she hated Piers, and then he came back into her life. Try as she did to fight it, she realized hopelessly that she was as vulnerable as ever to his attraction.', 'Romance', 'https://covers.openlibrary.org/b/id/7321349-L.jpg', 1982),
    ('OL3458001W', 'The Girl with Green Eyes', 'Betty Neels', 'Lucy wasn''t a career girl

Unlike her two bright go-getting sisters, Lucy''s goal was to find a man she loved and settle down with him to a life of happy domesticity.

But Mr. Right seemed to be peculiarly elusive. Until the day that Lucy encountered the eminent pediatrician William Thurloe and fell head-over-heels in love with him.

Not that she had the faintest hope of attracting his interest. Especially with the glamorous Fiona as direct competition. And yet Lucy knew there had to be some way of making William notice her.. . .', 'Romance', 'https://covers.openlibrary.org/b/id/1186940-L.jpg', 1990),
    ('OL5236259W', 'No Alternative', 'Margaret Way', '**Her second marriage would last forever...**

After 31 year old Kyle Endfield''s betrayal of their 2 year marriage vows, 21 year old Lynda had rejected his wealth and power and divorced him immediately. She knew she would never love again, but she had been relieved to escape with some measure of her pride intact.

Kyle, however, had never accepted her defection. 3 years later, he exploited her brother''s weakness for money and blackmailed Lynda into remarrying him -- this time for keeps.

To make matters worse, if Kyle were to become bored with his repossessed wife and return to his former mistress Olivia, Lynda would have no choice but to stay and endure the humiliation.', 'Romance', 'https://covers.openlibrary.org/b/id/6907771-L.jpg', 1983),
    ('OL9367818W', 'Never Count Tomorrow', 'Daphne Clair', 'The advertisement for a job as home help to the Wingard family on a farm in the hill country of New Zealand was just the thing Lin had been wanting - though not for the usual reasons. It was not the work she needed; it was that she hoped it would lead her to what she was searching for. But she had still not found it when she realised she had fallen in love with the son of the family, Soren, and everything crashed about her in ruins. Could she get away from him before she did any more harm?', 'Romance', 'https://covers.openlibrary.org/b/id/9242833-L.jpg', 1980),
    ('OL8315359W', 'Impossible Bargain', 'Patricia Wilson', '"I want you to be my fiancee."

 Julian Forrest''s words were businesslike, but Merissa''s first instinct was to run from the threatening brilliance of the raw male look of the man.

 Yet she agreed to his madcap scheme to pose as his bride-to-be, ostensibly to dispatch unwanted females from his busy life. After all, Merissa''s modeling work barely provided for an ailing mother and a father''s debts, and the fee Julian offered was exorbitant.

 She could do it, Merissa determined. She''d survive the necessary close contact with this unpredictable man--and hopefully the whole ridiculous affair--with her heart and her mind still her own!', 'Romance', 'https://covers.openlibrary.org/b/id/6628857-L.jpg', 1987),
    ('OL3759349W', 'Past Passion', 'Penny Jordan', 'Too close...
 
At eighteen, Nicola had made a terrible mistake and eight years later is still punishing herself for her folly. But her shameful secret comes full circle when Matt Hunt walks back into her life -- as her new boss. Not that Matt recognizes the assured, controlled businesswoman as the girl who had shared his bed for one brief night. 

Her dread of discovery attacks her frail self-control. But so does Nicola''s consuming need for the man who has haunted her dreams for so long. What will she do when Matt, inevitably, recognizes her...?', 'Romance', 'https://covers.openlibrary.org/b/id/7248486-L.jpg', 1992),
    ('OL3759116W', 'Lover''s Touch', 'Penny Jordan', 'Lady Eleanor de Tressail was simply mortified

Bad enough that before his death, her old-fashioned grandfather had ensured that their impoverished estate wouldn''t have to be sold--by arranging her marriage. But to Joss Wycliffe of all people--the self-made millionaire who despised her!

Mistaking Nell''s shyness for aristocratic disdain, Joss contemptuously told her that he was marrying her only for her social status. He never suspected that icily untouchable Nell loved him desperately.

Her wounded pride kept her from revealing her true feelings. Particularly when Joss''s jealous secretary did her best to widen the rift between them...', 'Romance', 'https://covers.openlibrary.org/b/id/12394501-L.jpg', 1989),
    ('OL11328452W', 'Bittersweet Passion', 'Lynne Graham', 'In desperation Claire asked Dane to marry her

Her adoptive grandfather had left Claire Fletcher his entire estate on the condition that she marry one of his grandsons.

But he must have forgotten that the free-spirited Dane Visconti, though long banished from the family''s realm, still qualified. And Claire had always idolized and trusted Dane.

With his worldly reputation, Claire conceded Dane was not the marrying kind, so when he agreed she promised to make no demands on him. But Dane made no promise in return - and insisted on a few conditions of his own.', 'Romance', 'https://covers.openlibrary.org/b/id/7322367-L.jpg', 1987),
    ('OL3467487W', 'Contra Su Voluntad', 'Sara Craven', 'Darcy Langton is stunned when she finds herself engaged to businessman Joel Castille—traded as part of a business merger! While Joel represents everything that she detests in a mate, he''s also the most charismatic man she''s ever met.Joel has no intentions of honoring their in-name-only agreement, and away from the boardroom Darcy is unable to resist his sensual persuasions. But when Darcy makes a shocking discovery, Joel must win her back—or risk losing his most valuable asset forever....', 'Romance', 'https://covers.openlibrary.org/b/id/1186726-L.jpg', 2006),
    ('OL3457933W', 'When Two Paths Meet', 'Betty Neels', 'He had saved her, but he didn''t love her.
Katherine Marsh was practically a slave to her brother''s family in the small English country where she lived. Then she met Dr. Jason Fitzroy - and fell instantly in love. 
Dr. Fitzroy found her a job at the hospital, and gave her a new sense of self-respect. He also gave her her first taste of freedom missing from her earlier years. 
But Katherine knew she could never truly be free - not while her heart was a prisoner of love.', 'Romance', 'https://covers.openlibrary.org/b/id/218961-L.jpg', 1988),
    ('OL5091273W', 'Dark Lover', 'J. R. Ward', 'In the shadows of the night in Caldwell, New York, there''s a deadly turf war going on between vampires and their slayers. There exists a secret band of brothers like no other--six vampire warriors, defenders of their race. Yet none of them relishes killing their enemies, the lessers, more than Wrath, the leader of the Black Dagger Brotherhood....

The only purebred vampire left on the planet, Wrath has a score to settle with the slayers who murdered his parents centuries ago. But, when one of his most trusted fighters is killed--orphaning a half-breed daughter unaware of her heritage or her fate--Wrath must usher the beautiful female into the world of the undead....

Racked by a restlessness in her body that wasn''t there before, Beth Randall is helpless against the dangerously sexy man who comes to her at night with shadows in his eyes. His tales of brotherhood and blood frighten her. But his touch ignites a dawning hunger that threatens to consume them both....', 'Romance', 'https://covers.openlibrary.org/b/id/293803-L.jpg', 2005),
    ('OL3759318W', 'Beyond Compare', 'Penny Jordan', 'It was a mistake. It just had to be
Surely Howard would come to his senses and realize Holly was the one for him. When he did, she''d be waiting.

Meanwhile, though, Holly Witchell was determined to make Howard Neston

appreciate what he had lost in jilting her for her glamorous schoolmate, Rosamund. And who better than Drew Hammond to help her--after all,
Rosamund had jilted Drew to become engaged to Howard.

It seemed logical for Holly and Drew to pretend to be lovers while theywaited for their real loves to change their minds ....', 'Romance', 'https://covers.openlibrary.org/b/id/10504888-L.jpg', 1989),
    ('OL81634W', 'Misery', 'Stephen King', 'Novelist Paul Sheldon has plans to make the difficult transition from writing historical romances featuring heroine Misery Chastain to publishing literary fiction. Annie Wilkes, Sheldon''s number one fan, rescues the author from the scene of a car accident. The former nurse takes care of him in her remote house, but becomes irate when she discovers that the author has killed Misery off in his latest book. Annie keeps Sheldon prisoner while forcing him to write a book that brings Misery back to life.

[Source][1]', 'Horror', 'https://covers.openlibrary.org/b/id/8259296-L.jpg', 1978),
    ('OL81633W', 'The Shining', 'Stephen King', 'The Shining is a 1977 horror novel by American author Stephen King. It is King''s third published novel and first hardback bestseller; its success firmly established King as a preeminent author in the horror genre. The setting and characters are influenced by King''s personal experiences, including both his visit to The Stanley Hotel in 1974 and his struggle with alcoholism. The book was followed by a sequel, Doctor Sleep, published in 2013.

The Shining centers on the life of Jack Torrance, a struggling writer and recovering alcoholic who accepts a position as the off-season caretaker of the historic Overlook Hotel in the Colorado Rockies. His family accompanies him on this job, including his young son Danny Torrance, who possesses "the shining", an array of psychic abilities that allow Danny to see the hotel''s horrific past. Soon, after a winter storm leaves them snowbound, the supernatural forces inhabiting the hotel influence Jack''s sanity, leaving his wife and son in incredible danger.', 'Horror', 'https://covers.openlibrary.org/b/id/12376585-L.jpg', 1977),
    ('OL927199W', 'The Exorcist', 'William Peter Blatty', 'The Exorcist is a 1971 horror novel by American writer William Peter Blatty. The book details the demonic possession of eleven-year-old Regan MacNeil, the daughter of a famous actress, and the two priests who attempt to exorcise the demon. Published by Harper & Row, the novel was the basis of a highly successful film adaptation released two years later, whose screenplay was also written and produced by Blatty, and part of The Exorcist franchise.

The novel was inspired by a 1949 case of demonic possession and exorcism that Blatty heard about while he was a student in the class of 1950 at Georgetown University. As a result, the novel takes place in Washington, D.C., near the campus of Georgetown University. In September 2011, the novel was reprinted by Harper Collins to celebrate its fortieth anniversary, with slight revisions made by Blatty as well as interior title artwork by Jeremy Caniglia.', 'Horror', 'https://covers.openlibrary.org/b/id/12715730-L.jpg', 1971),
    ('OL81610W', 'Cujo', 'Stephen King', 'Cujo (/ˈkjuːdʒoʊ/) is a 1981 psychological horror novel by American writer Stephen King about a rabid Saint Bernard. The novel won the British Fantasy Award in 1982 and was made into a film in 1983.', 'Horror', 'https://covers.openlibrary.org/b/id/8570003-L.jpg', 1981),
    ('OL32195W', 'House of Leaves', 'Mark Z. Danielewski', 'A young family moves into a small home on Ash Tree Lane where they discover something is terribly wrong: their house is bigger on the inside than it is on the outside.

Of course, neither Pulitzer Prize-winning photojournalist Will Navidson nor his companion Karen Green was prepared to face the consequences of that impossibility, until the day their two little children wandered off and their voices eerily began to return another story—of creature darkness, of an ever-growing abyss behind a closet door, and of that unholy growl which soon enough would tear through their walls and consume all their dreams.', 'Horror', 'https://covers.openlibrary.org/b/id/6450442-L.jpg', 1998),
    ('OL9973101W', 'The Long Walk', 'Stephen King', 'The Long Walk is a dystopian horror novel by American writer Stephen King, published in 1979, under the pseudonym Richard Bachman. It was collected in 1985 in the hardcover omnibus The Bachman Books, and has seen several reprints since, as both paperback and hardback.

Set in a future dystopian America, ruled by a totalitarian and militaristic dictator, the plot revolves around the contestants of a grueling, annual walking contest. In 2000, the American Library Association listed The Long Walk as one of the 100 best books for teenage readers published between 1966 and 2000.', 'Horror', 'https://covers.openlibrary.org/b/id/14653609-L.jpg', 1979),
    ('OL81613W', 'It', 'Stephen King', '"*It*" is a 1986 horror novel by American author Stephen King. "*It*" was his 22nd book and his 17th novel written under his own name. The story follows the experiences of seven children as they are terrorized by an evil entity that exploits the fears of its victims to disguise itself while hunting its prey. "*It*" primarily appears in the form of Pennywise the Dancing Clown to attract its preferred prey of young children.

The novel won the British Fantasy Award in 1987, and received nominations for the Locus and World Fantasy Awards that same year.

In 2003, "*It*" was listed at number 144 on the BBC''s The Big Read poll.', 'Horror', 'https://covers.openlibrary.org/b/id/8569284-L.jpg', 1986),
    ('OL81619W', 'Christine', 'Stephen King', 'A love triangle involving 17-year-old misfit Arnie Cunningham, his new girlfriend and a haunted 1958 Plymouth Fury. Dubbed Christine by her previous owner, Arnie''s first car is jealous, possessive and deadly. 
([source][1])', 'Horror', 'https://covers.openlibrary.org/b/id/14655985-L.jpg', 1983),
    ('OL81606W', 'Four Past Midnight', 'Stephen King', 'Four Past Midnight is a collection of novellas written by Stephen King in 1988 and 1989 and published in August 1990. It is his second book of this type, the first one being Different Seasons. The collection won the Bram Stoker Award in 1990 for Best Collection and was nominated for a Locus Award in 1991.
    
One Past Midnight: "[The Langoliers][1]" takes a red-eye flight from L.A. to Boston into a most unfriendly sky. Only eleven passengers survive, but landing in an eerily empty world makes them wish they hadn''t. Something''s waiting for them, you see....
    
Two Past Midnight: "[Secret Window, Secret Garden][2]" enters the suddenly strange life of writer Mort Rainey, recently divorced, depressed, and alone on the shore of Tashmore Lake. Alone, that is, until a figure named John Shooter arrives, pointing an accusing finger.
    
Three Past Midnight: "[The Library Policeman][3]" is set in Junction City, Iowa, an unlikely place for evil to be hiding. But for small businessman Sam Peebles, who thinks he may be losing his mind, another enemy is hiding there as well--the truth. If he can find it in time, he might stand a chance.
    
Four Past Midnight: The flat surface of a Polaroid photograph becomes for fifteen-year-old Kevin Delevan an invitation to the supernatural. Old Pop Merrill, Castle Rock''s sharpest trader, wants to crash the party for profit, but "[The Sun Dog][4]," a creature that shouldn''t exist at all, is a very dangerous investment.', 'Horror', 'https://covers.openlibrary.org/b/id/8413143-L.jpg', 1990),
    ('OL257785W', 'The Hellbound Heart', 'Clive Barker', 'From his Books of Blood to The Damnation Game, Weaveworld, and The Great and Secret Show, to scores of short stories, bestselling novels, and now major motion pictures, no one comes close to the vivid imagination and unique terrors provided by Clive Barker.', 'Horror', 'https://covers.openlibrary.org/b/id/1726053-L.jpg', 1991),
    ('OL3388961W', 'The Great God Pan', 'Arthur Machen', 'Arthur Machen''s first book, THE GREAT GOD PAN, published in 1894, is still one of the greatest works of weird horror and decadence ever produced. Arthur Machen with his taste for the bizarre and macabre, unfurls the tale of a young girl cursed by her unnatural parentage to become a creature of shape-shifting, poly-sexual, demi-human evil.', 'Horror', 'https://covers.openlibrary.org/b/id/921610-L.jpg', 1894),
    ('OL149210W', 'Thinner', 'Stephen King', 'Thinner is a horror novel by American author Stephen King, published in 1984 by NAL under King''s pseudonym Richard Bachman. The story centers on lawyer Billy Halleck, who kills a crossing Romani woman in a road accident and escapes legal punishment because of his connections. However, the woman''s father places a curse on Halleck, which causes him to lose weight uncontrollably.', 'Horror', 'https://covers.openlibrary.org/b/id/8274288-L.jpg', 1984),
    ('OL81631W', 'Pet Sematary', 'Stephen King', 'Pet Sematary is a 1983 horror novel by American writer Stephen King. The novel was nominated for a World Fantasy Award for Best Novel in 1986', 'Horror', 'https://covers.openlibrary.org/b/id/12015500-L.jpg', 1983),
    ('OL28319W', 'The Stepford Wives', 'Ira Levin', 'The Stepford Wives is a 1972 satirical novel by Ira Levin. The story concerns Joanna Eberhart, a photographer and young mother who suspects the submissive housewives in her new idyllic Connecticut neighborhood may be robots created by their husbands.

Also contained in:

 - Reader''s Digest Condensed Books. Volume 1 - 1973
 - Three by Ira Levin', 'Horror', 'https://covers.openlibrary.org/b/id/8409254-L.jpg', 1972),
    ('OL15094430W', 'Fear Street - The Knife', 'Robert Lawrence Stine', 'Every private room at Shadyside Hospital holds a shocking secret of its own. Student volunteer Laurie stumbles onto the hospital''s sickest secret of all.', 'Horror', 'https://covers.openlibrary.org/b/id/2547647-L.jpg', 1991),
    ('OL263259W', 'Phantoms', 'Dean Koontz', 'After finding one hundred and fifty people grotesquely dead in the tiny mountain town of Snowfield, California, officials cannot imagine anything as gruesome as the real reason for their death.', 'Horror', 'https://covers.openlibrary.org/b/id/8274300-L.jpg', 1983),
    ('OL81618W', 'The Stand', 'Stephen King', 'One man escapes from a biological weapon facility after an accident, carrying with him the deadly virus known as Captain Tripps, a rapidly mutating flu that - in the ensuing weeks - wipes out most of the world''s population. In the aftermath, survivors choose between following an elderly black woman to Boulder or the dark man, Randall Flagg, who has set up his command post in Las Vegas. The two factions prepare for a confrontation between the forces of good and evil.
([source][1])', 'Horror', 'https://covers.openlibrary.org/b/id/9255992-L.jpg', 1978),
    ('OL407498W', 'The Power of Darkness', 'Edith Nesbit', 'The book "Power of Darkness" is an edition of twenty dark, mysterious stories. Each has its significance, perhaps in love, often in human terror and solitary endurance. From the love a man bears his dead wife and the misunderstanding that hinders his sight, to the strange country superstition that comes true, the writer displays the strange imagination that comes to deep human minds', 'Horror', 'https://covers.openlibrary.org/b/id/882715-L.jpg', 2006),
    ('OL72313W', 'The New Girl', 'Robert Lawrence Stine', 'The new girl is as pale as a ghost, blond, and eerily beautiful -- and she seems to need him as much as he wants her. Cory Brooks hungers for Anna Corwin''s kisses, drowns in her light blue eyes. He can''t get her out of his mind. He has been loosing sleep, ditching his friends...and everyone has noticed.

Then as suddenly as she came to Shadyside High, Anna disappears. To find a cure for his obsession, Cory must go to Anna''s house on Fear Street -- no matter what the consequences.

Anna may be the love of his life ... but finding out her secret might mean his death.', 'Horror', 'https://covers.openlibrary.org/b/id/8203024-L.jpg', 1989),
    ('OL41078W', 'The Fall of the House of Usher', 'Edgar Allan Poe', '"The Fall of the House of Usher" is a short story by American writer Edgar Allan Poe, first published in 1839 in Burton''s Gentleman''s Magazine, then included in the collection Tales of the Grotesque and Arabesque in 1840. The short story, a work of Gothic fiction, includes themes of madness, family, isolation, and metaphysical identities.', 'Horror', 'https://covers.openlibrary.org/b/id/11838138-L.jpg', 1704),
    ('OL85892W', 'Dracula', 'Bram Stoker', 'In the story, a couple and their friends are tormented by Count Dracula—a supernatural, blood-drinking entity bound by a contagious curse—who intends to leave his secluded castle in Transylvania for the bustling London of the 19th century. With the help of Professor Van Helsing, the group sets out to confront the undead, despite all the dangers such an offensive will entail.', 'Horror', 'https://covers.openlibrary.org/b/id/12216503-L.jpg', 1897),
    ('OL81627W', 'Skeleton crew', 'Stephen King', 'From the Flap:

The Master at his scarifying best! From heart-pounding terror to the eeriest of whimsy--tales from the outer limits of one of the greatest imaginations of our time!

Evil that breathes and walks and shrieks, brave new worlds and horror shows, human desperation bursting into deadly menace--such are the themes of these astounding works of fiction. In the tradition of Poe and Stevenson, of Lovecraft and The Twilight Zone, Stephen King has fused images of fear as old as time with the iconography of contemporary American life to create his own special brand of horror--one that has kept millions of readers turning the pages even as they gasp.

In the book-length story "The Mist," a supermarket becomes the last bastion of humanity as a peril beyond dimension invades the earth. . .

Touch "The Man Who Would Not Shake Hands," and say your prayers . . .

There are some things in attics which are better left alone, things like "The Monkey" . . .

The most sublime woman driver on earth offers a man "Mrs. Todd''s Shortcut" to paradise . . .

A boy''s sanity is pushed to the edge when he''s left alone with the odious corpse of "Gramma" . . .

If you were stunned by Gremlins, the Fornits of "The Ballad of the Flexible Bullet" will knock your socks off . . .

Trucks that punish and beautiful teen demons who seduce a young man to massacre; curses whose malevolence grows through the years; obscene presences and angels of grace--here, indeed, is a night-blooming bouquet of chills and thrills.
(source)', 'Horror', 'https://covers.openlibrary.org/b/id/14657166-L.jpg', 1985),
    ('OL81611W', 'Desperation', 'Stephen King', 'Located off a desolate stretch of Interstate 50, Desperation, Nevada has few connections with the rest of the world. It is a place, though, where the seams between worlds are thin. Miners at the China Pit have accidentally broken into another dimension and released a horrific creature known as Tak, who takes human form by hijacking some of the town''s residents. The forces of good orchestrate a confrontation between this ancient evil and a group of unsuspecting travelers who are lured to the dying town. This rag-tag band of unwilling champions is led by a young boy who speaks to God. 

([source][1])', 'Horror', 'https://covers.openlibrary.org/b/id/8757374-L.jpg', 1996),
    ('OL9964695W', 'Fear Street - Sunburn', 'Robert Lawrence Stine', 'Claudia Walker was in search of the perfect tan when she accepted her friend Marla''s invitation to spend the weekend at her cliffside beach house.  Little did she know that horrible fatal accidents would occur on the beach and in the house.  Or are they really accidents?', 'Horror', 'https://covers.openlibrary.org/b/id/9738031-L.jpg', 1993),
    ('OL72336W', 'The Sleepwalker', 'Robert Lawrence Stine', 'One week after she starts her summer job on Fear Street with old Mrs. Cottler, Mayra Barnes begins to sleepwalk, always waking up outdoors in the middle of the night never knowing where she is! Things take a disturbing turn when Mayra discovers Mrs. Cottler may be a witch. Is the old woman casting a spell on Mayra to make her sleepwalk? More horrifying, Mayra is being followed by a menacing stranger who seems to recognize her. But she''s never seen him in her life! Mayra''s sleepwalking is leading her into more and more peril. She soon realizes she must take action. She must find out what is happening to her--or she may never leave Fear Street alive!', 'Horror', 'https://covers.openlibrary.org/b/id/408246-L.jpg', 1990),
    ('OL81623W', 'Firestarter', 'Stephen King', 'Firestarter is a science fiction-horror thriller novel by Stephen King, first published in September 1980. In July and August 1980, two excerpts from the novel were published in Omni. In 1981, Firestarter was nominated as Best Novel for the British Fantasy Award, Locus Poll Award, and Balrog Award.', 'Horror', 'https://covers.openlibrary.org/b/id/12015446-L.jpg', 1980),
    ('OL81605W', 'Danse Macabre', 'Stephen King', 'This is a non-fiction study of the horror genre including books, movies, television, etc.
([source][1])', 'Horror', 'https://covers.openlibrary.org/b/id/8443662-L.jpg', 1980),
    ('OL72282W', 'Haunted', 'Robert Lawrence Stine', 'A ghost  from the future is haunting Melissa and it''s up to the two of them to prevent a young man''s death from ever happening.', 'Horror', 'https://covers.openlibrary.org/b/id/4984834-L.jpg', 1990),
    ('OL81626W', 'Carrie', 'Stephen King', 'The story of misfit high-school girl, Carrie White, who gradually discovers that she has telekinetic powers. Repressed by a domineering, ultra-religious mother and tormented by her peers at school, her efforts to fit in lead to a dramatic confrontation during the senior prom.
(source)', 'Horror', 'https://covers.openlibrary.org/b/id/9256043-L.jpg', 1974),
    ('OL41050W', 'The Masque of the Red Death', 'Edgar Allan Poe', '"The Masque of the Red Death" (originally published as "The Mask of the Red Death: A Fantasy") is a short story by American writer Edgar Allan Poe, first published in 1842. The story follows Prince Prospero''s attempts to avoid a dangerous plague, known as the Red Death, by hiding in his abbey. He, along with many other wealthy nobles, hosts a masquerade ball in seven rooms of the abbey, each decorated with a different color. In the midst of their revelry, a mysterious figure disguised as a Red Death victim enters and makes his way through each of the rooms. Prospero dies after confronting this stranger, whose "costume" proves to contain nothing tangible inside it; the guests also die in turn.

The story was first published in May 1842 in Graham''s Magazine and has since been adapted in many different forms, including a 1964 film starring Vincent Price. Poe''s short story has also been alluded to by other works in many types of media.', 'Horror', 'https://covers.openlibrary.org/b/id/11860130-L.jpg', 1922),
    ('OL81597W', 'Cell', 'Stephen King', 'Cell is a 2006 apocalyptic horror novel by American author Stephen King. The story follows a New England artist struggling to reunite with his young son after a mysterious signal broadcast over the global cell phone network turns the majority of his fellow humans into mindless vicious animals.', 'Horror', 'https://covers.openlibrary.org/b/id/14654054-L.jpg', 2006),
    ('OL450063W', 'Frankenstein; or, The Modern Prometheus', 'Mary Shelley', '*Frankenstein; or, The Modern Prometheus* is an 1818 novel written by English author Mary Shelley. Frankenstein tells the story of Victor Frankenstein, a young scientist who creates a sapient creature in an unorthodox scientific experiment. Shelley started writing the story when she was 18, and the first edition was published anonymously in London on 1 January 1818, when she was 20. Her name first appeared in the second edition, which was published in Paris in 1821.', 'Horror', 'https://covers.openlibrary.org/b/id/12356249-L.jpg', 1818),
    ('OL64225W', 'Works (Buried Talents / Dance of the Dead / Dress of White Silk / From Shadowed Places / I Am Legend / Mad House / Person to Person / Prey / The Funeral / The Near Departed / Witch War)', 'Richard Matheson', 'Robert Neville may well be the last living man on Earth . . . but he is not alone.
 
An incurable plague has mutated every other man, woman, and child into bloodthirsty, nocturnal creatures who are determined to destroy him.
 
By day, he is a hunter, stalking the infected monstrosities through the abandoned ruins of civilization. By night, he barricades himself in his home and prays for dawn....

*From the publisher*', 'Horror', 'https://covers.openlibrary.org/b/id/6462252-L.jpg', 1970),
    ('OL81603W', 'Insomnia', 'Stephen King', 'Insomnia is a 1994 horror/fantasy novel by American writer Stephen King. It follows retired widower Ralph Roberts whose increasing insomnia allows him to perceive auras and other hidden things, leading him to join a conflict between the forces of the Purpose and the Random. Like It and Dreamcatcher, the story is set in the fictional town of Derry, Maine. It includes connections to other Stephen King stories, particularly his novel series The Dark Tower.', 'Horror', 'https://covers.openlibrary.org/b/id/7886954-L.jpg', 1994),
    ('OL72311W', 'Fear Street - The New Boy', 'Robert Lawrence Stine', 'Janie and her friends make bets on which of them will date hunky, mysterious Ross first. But then the murders begin.', 'Horror', 'https://covers.openlibrary.org/b/id/4975644-L.jpg', 1993),
    ('OL149144W', 'The Mist', 'Stephen King', 'David Drayton, his son Billy, and their neighbor Brent Norton head to the local grocery store to replenish supplies following a freak storm. Once there, they and other local citizens are trapped by a strange mist that has enveloped the town and in which strange creatures are lurking. As the mist takes its toll on the nerves of those trapped in the store, a religious zealot, Mrs. Carmody begins to play on their fears to convince them that this is God’s vengeance for their sins and that a sacrifice must be made and two groups—those for and those against—are aligned. When it is realized that staying in the store may prove fatal, a small group including the Draytons, store employee Ollie Weeks, Amanda Dumfries, Irene Reppler, and Dan Miller attempt to make their escape. They find that what’s “out there” may be worse than what they left behind.
(source)', 'Horror', 'https://covers.openlibrary.org/b/id/9330636-L.jpg', 1925),
    ('OL72303W', 'Fear Street - Missing', 'Robert Lawrence Stine', 'Welcome to Fear Street
Don’t listen to the stories they tell you about Fear Street. Wouldn’t you rather explore it yourself…and see if its dark terror and unexplained mysteries are true? You’re not afraid, are you?
“Please help…Our parents are missing!"
What would you do if your parents didn’t come home, didn’t call, left no note? At first, Mark and Cara Burroughs aren’t terribly alarmed. Their parents have stayed out late before. But then other things start to go wrong. Mark’s girlfriend Gena breaks up with him and suddenly disappears. The police don’t seem at all interested in finding Mark and Cara’s parents. And their mysterious cousin who boards with them seems to be spying on their every move!
When murder strikes, Mark and Cara learn their terror is only beginning. Someone wants them to disappear too! But why? The answer lies deep in the Fear Street Woods. But will they live long enough to find it?', 'Horror', 'https://covers.openlibrary.org/b/id/5005544-L.jpg', 1990),
    ('OL457864W', 'Books of Blood Volume One', 'Clive Barker', 'With the publication of Books of Blood, Clive Barker became an overnight literary sensation. His tour de force collection of brilliantly disturbing tales demonstrated a genius for dark invention that rivaled Poe and Sade. He was hailed by Stephen King as "the future of horror", and won both the British and World Fantasy Awards. Clive Barker''s Books of Blood marked the beginning of a career that would transcend genre and media. As a screenwriter and director, he launched the phenomenal Hellraiser series of films. As a gifted artist, he inspired an acclaimed collection of graphic novels. But it is his powerful writing style and arresting imagery that have made Books of Blood a classic—and Clive Barker a cult phenomenon. Read him. And rediscover the true meaning of fear.', 'Horror', 'https://covers.openlibrary.org/b/id/271223-L.jpg', 1985),
    ('OL81599W', 'The talisman', 'Stephen King, Peter Straub', 'The Talisman is a 1984 fantasy novel by American writers Stephen King and Peter Straub. The Talisman was nominated for both the Locus and World Fantasy Awards in 1985. King and Straub followed up with a sequel, Black House (2001).

Followed by: Black House', 'Horror', 'https://covers.openlibrary.org/b/id/14651566-L.jpg', 1925),
    ('OL77828W', 'The Queen of the Damned', 'Anne Rice', 'The third book in The Vampire Chronicles, Queen of the Damned, follows three parallel storylines.

The rock star Vampire Lestat prepares for a concert in San Francisco, unaware that hundreds of vampires will be among the fans that night and that they are committed to destroying him for risking exposing them all.

The sleep of a group of men and women, vampires and mortals, around the world is disturbed by a mysterious dream of red-haired twins who suffer an unspeakable tragedy. The dreamers, as if pulled, move toward each other, the nightmare becoming clearer the closer they get. Some die on the way, some live to face they terrifying fate their pilgrimage is building to.

Lestat''s journey to a cavern deep beneath a Greek Island on his quest for the origins of the vampire race awakened Akasha, Queen of the Damed and mother of all vampires, from her 6,000 year sleep. Awake and angry, Akasha plans to save mankind from itself by elevating herself and her chosen son/lover to the level of the gods.

As these three threads wind seamlessly together, the origins and culture of vampires are revealed, as is the length and breadth of their effect on the mortal world. The threads are brought together in the twentieth century when the fate of the living and the living dead is rewritten. 
([source][1])', 'Horror', 'https://covers.openlibrary.org/b/id/9255774-L.jpg', 1988),
    ('OL16820059W', 'Mr. Mercedes', 'Stephen King, Stephen king, Ingah Mikhaʼeli', 'In the frigid pre-dawn hours, in a distressed Midwestern city, hundreds of desperate unemployed folks are lined up for a spot at a job fair. Without warning, a lone driver plows through the crowd in a stolen Mercedes, running over the innocent, backing up, and charging again. Eight people are killed; fifteen are wounded. The killer escapes.

In another part of town, months later, a retired cop named Bill Hodges is still haunted by the unsolved crime. When he gets a crazed letter from someone who self-identifies as the "perk" and threatens an even more diabolical attack, Hodges wakes up from his depressed and vacant retirement, hell-bent on preventing another tragedy.

Brady Hartfield lives with his alcoholic mother in the house where he was born. He loved the feel of death under the wheels of the Mercedes, and he wants that rush again.

Only Bill Hodges, with a couple of highly unlikely allies, can apprehend the killer before he strikes again. And they have no time to lose, because Brady’s next mission, if it succeeds, will kill or maim thousands.

Mr. Mercedes is a war between good and evil, from the master of suspense whose insight into the mind of this obsessed, insane killer is chilling and unforgettable.', 'Horror', 'https://covers.openlibrary.org/b/id/14653120-L.jpg', 2013),
    ('OL679358W', 'Coraline', 'Neil Gaiman', 'When Coraline steps through a door to find another house strangely similar to her own (only better), things seem marvelous.

But there''s another mother there, and another father, and they want her to stay and be their little girl. They want to change her and never let her go.

Coraline will have to fight with all her wit and courage if she is to save herself and return to her ordinary life.', 'Horror', 'https://covers.openlibrary.org/b/id/14171421-L.jpg', 2001),
    ('OL15094485W', 'Lights Out', 'Robert Lawrence Stine', 'Welcome to Fear Street.

Don’t listen to the stories they tell you about Fear Street. Wouldn’t you rather explore it yourself…and see if its dark terror and unexplained mysteries are true? You’re not afraid, are you?

Who killed the counselor?

“I could kill you!” screamed Geri Marcus.

Could she? Would she? something is very wrong at Camp Nightwing, and junior counselor Holly Flynn is determined to solve the mystery before it destroys the camp!

The trouble begins with frightening acts of vandalism. After each, a red feather is left behind—signature of the culprit.

Suddenly, one of the counselors is dead. “An accident,” say the police. But Holly knows better—and she knows she’s next. Holly can’t trust anyone now, not even her best friend, as she stalks the camp killer—and hopes that it soon won’t be “lights out” for her!', 'Horror', 'https://covers.openlibrary.org/b/id/6615398-L.jpg', 1991),
    ('OL72352W', 'Welcome to Dead House', 'Robert Lawrence Stine', 'Amanda and Josh think the old house they have just moved into is weird. Spooky. Possibly haunted. And the town of Dark Falls is pretty strange, too. But their parents don''t believe them. You''ll get used to it, they say. Go out and make some new friends. So Amanda and Josh do. But these new friends are not exactly what their parents had in mind. Because they want to be friends...forever.', 'Horror', 'https://covers.openlibrary.org/b/id/11290170-L.jpg', 1992),
    ('OL480105W', 'Fear Street - The Overnight', 'Robert Lawrence Stine', '"Nothing bad will happen," Della O''Connor assures her friends in the Outdoors Club. So what if their advisor can''t go on the overnight to Fear Island—won''t it be more fun with no adults around?

But it''s no fun at all when Della gets lost in the woods, and the dangerous stranger appears, whispering threats, driving her to a violent act.

Suddenly all of her friends are involved, prisoners in a conspiracy of silence, trying to conceal the terrible truth. But someone saw what Della did. And he''s threatening them all, forcing them back to Fear Island to find the evidence they forgot to bury...', 'Horror', 'https://covers.openlibrary.org/b/id/2547598-L.jpg', 1989),
    ('OL72342W', 'Fear Street - The Surprise Party', 'Robert Lawrence Stine', 'It''s been a year since Evan died in the Fear Street woods. A year since Ellen moved away, and "the gang" split up. Meg Dalton felt as if she''d lost her best friends. Everyone changed. Even her boyfriend Tony was acting moody, strange. But when she heard that Ellen was returning for a visit, Meg had the answer: she''d bring them all together again with a surprise party for Ellen!

That''s when the terror began...the phone calls...the threats...the bizarre acts of violence. "Cancel the party—or else," the whispered voice on the phone told her. Meg was scared, and with good reason. Whoever wanted the party stopped woud try anything—even murder! But why? The dark Fear Street woods held the answer...if Meg dared to discover the truth!', 'Horror', 'https://covers.openlibrary.org/b/id/4974927-L.jpg', 1989),
    ('OL257791W', 'The Thief of Always', 'Clive Barker', 'After a mysterious stranger promises to end his boredom with a trip to the magical Holiday House, ten-year-old Harvey learns that his fun has a high price.', 'Horror', 'https://covers.openlibrary.org/b/id/45084-L.jpg', 1992),
    ('OL3625242W', 'The Vampyre', 'John William Polidori', 'The Vampyre*, a short gothic novel by John William Polidori, was first published in 1819 and is considered the first modern vampire story. The story features Lord Ruthven, a seductive aristocrat with unnatural powers over men and women, and an insatiable thirst for blood. Polidori''s innovative portrayal of the vampire as a Byronic figure is said to have set the template for the modern vampire.', 'Horror', 'https://covers.openlibrary.org/b/id/4871002-L.jpg', 1819),
    ('OL15093972W', 'Fear Street - Dead End', 'Robert Lawrence Stine', 'Natalie and her friends share a terrible secret: they were all in the car that foggy night--the night someone died at the dead end. Now someone is trying to make sure that nobody ever learns this terrible secret--and will kill to keep it quiet.', 'Horror', 'https://covers.openlibrary.org/b/id/9965640-L.jpg', 1995),
    ('OL81617W', 'Gerald''s Game', 'Stephen King', 'Gerald and Jessie Burlingame have gone to their summer home on a warm weekday in October for a romantic interlude. After being handcuffed to her bedposts, Jessie tires of her husband''s games, but when Gerald refuses to stop she lashes out at him with deadly consequences. Still handcuffed, she is trapped and alone. Painful memories from her childhood bedevil her. Her only company is a hungry stray dog and the sundry voices that populate her mind. As night comes, she is unsure whether it is her imagination or if she has another companion: someone watching her from the corner of her dark bedroom.

([source][1])', 'Horror', 'https://covers.openlibrary.org/b/id/10705875-L.jpg', 1992),
    ('OL14909099W', 'Debt', 'David Graeber', 'The author shows that before there was money, there was debt. For 5,000 years humans have lived in societies divided into debtors and creditors. For 5,000 years debt and debt forgiveness have been at the center of political debates, laws and religions. The words “guilt,” “sin,” and “redemption” come from ancient debates about debt. These terms and the ideas of debt shape  our most basic ideas of right and wrong. [source][1]', 'History', 'https://covers.openlibrary.org/b/id/6299464-L.jpg', 2011),
    ('OL1073898W', 'The Story of Philosophy', 'Will Durant, 讀書新聞社', 'Includes chapters on Plato, Aristotle, Francis Bacon, Spinoza, Voltaire, Kant, and Nietzsche.', 'History', 'https://covers.openlibrary.org/b/id/405360-L.jpg', 1926),
    ('OL50283W', 'A People''s History of the United States', 'Howard Zinn, Kathy Emery, Ellen Reeves', 'Known for its lively, clear prose as well as its scholarly research, *A People''s History of the United States* is the only volume to tell America''s story from the point of view of -- and in the words of -- America''s women, factory workers, African Americans, Native Americans, working poor, and immigrant laborers.', 'History', 'https://covers.openlibrary.org/b/id/10592817-L.jpg', 1980),
    ('OL244537W', 'The Art of War', '孙武 (Sun Tzu)', 'The Art of War is an ancient Chinese military treatise dating from the Late Spring and Autumn Period. The work, which is attributed to the ancient Chinese military strategist Sun Tzu', 'History', 'https://covers.openlibrary.org/b/id/4849549-L.jpg', 1900),
    ('OL17075811W', 'Sapiens', 'Yuval Noah Harari', 'From a renowned historian comes a groundbreaking narrative of humanity’s creation and evolution—a #1 international bestseller—that explores the ways in which biology and history have defined us and enhanced our understanding of what it means to be “human.”

One hundred thousand years ago, at least six different species of humans inhabited Earth. Yet today there is only one—homo sapiens. What happened to the others? And what may happen to us?

Most books about the history of humanity pursue either a historical or a biological approach, but Dr. Yuval Noah Harari breaks the mold with this highly original book that begins about 70,000 years ago with the appearance of modern cognition. From examining the role evolving humans have played in the global ecosystem to charting the rise of empires, Sapiens integrates history and science to reconsider accepted narratives, connect past developments with contemporary concerns, and examine specific events within the context of larger ideas.

Dr. Harari also compels us to look ahead, because over the last few decades humans have begun to bend laws of natural selection that have governed life for the past four billion years. We are acquiring the ability to design not only the world around us, but also ourselves. Where is this leading us, and what do we want to become?

Featuring 27 photographs, 6 maps, and 25 illustrations/diagrams, this provocative and insightful work is sure to spark debate and is essential reading for aficionados of Jared Diamond, James Gleick, Matt Ridley, Robert Wright, and Sharon Moalem.', 'History', 'https://covers.openlibrary.org/b/id/8634250-L.jpg', 2011),
    ('OL18170596W', 'Ringkasan sejarat filsafat', 'K. Bertens', NULL, 'History', 'https://covers.openlibrary.org/b/id/8333070-L.jpg', 1975),
    ('OL47181W', 'The Rise and Fall of the Third Reich', 'William L. Shirer', 'Since it''s publication five decades ago, William L. Shirer''s monumental study of Hitler''s empire has been widely acclaimed as the definitive record of the twentieth century''s blackest hours. A worldwide bestseller with millions of copies in print, *The Rise and Fall of the Third Reich* offers an unparalleled and thrillingly told examination of how Adolf Hitler nearly succeeded in conquering the world. Here, in a thoughtful new introduction for the fiftieth anniversary of its National Book Award win, Ron Rosenbaum, author of the much-admired *Explaining Hitler*, takes a fresh and penetrating look at this vital and enduring classic and the role it continues to play in today''s discussions of the history of Nazi Germany.', 'History', 'https://covers.openlibrary.org/b/id/6558536-L.jpg', 1734),
    ('OL17732W', 'Bible', 'Bible', '"Readers who desire a more intimate knowledge of the historical context of the Bible will appreciate the NIV Archaeological Study Bible. Full of informative articles and full-color photographs of places and objects from biblical times, this Bible examines the archaeological record surrounding God’s Word and brings the biblical world to life. Readers’ personal studies will be enriched as they become more informed about the empires, places, and peoples of the ancient world. Features include: • Four-color interior throughout • Bottom-of-page study notes exploring passages that speak on archaeological and cultural facts • Articles (520) covering five main categories: Archaeological Sites, Cultural and Historical Notes, Ancient Peoples and Lands, the Reliability of the Bible, and Ancient Texts and Artifacts • Approximately 500 4-color photographs interspersed throughout • Detailed book introductions that provide basic, at-a-glance information • Detailed charts on pertinent topics • In-text color maps that assist the reader in placing the action "', 'History', 'https://covers.openlibrary.org/b/id/12707846-L.jpg', 1200),
    ('OL15683250W', 'Capitalist Realism', 'Mark Fisher, MARK FISHER', 'It is easier to imagine the end of the world than the end of capitalism. After 1989, capitalism has successfully presented itself as the only realistic political-economic system - a situation that the bank crisis of 2008, far from ending, actually compounded. The book analyses the development and principal features of this capitalist realism as a lived ideological framework. Using examples from politics, film (Children Of Men, Jason Bourne, Supernanny), fiction (Le Guin and Kafka), work and education, it argues that capitalist realism colours all areas of contemporary experience, is anything but realistic and asks how capitalism and its inconsistencies can be challenged. It is a sharp analysis of the post-ideological malaise that suggests that the economics and politics of free market neo-liberalism are givens rather than constructions.', 'History', 'https://covers.openlibrary.org/b/id/6707037-L.jpg', 2009),
    ('OL1810842W', 'The great conversation', 'Norman Melchert', NULL, 'History', 'https://covers.openlibrary.org/b/id/1454089-L.jpg', 1991),
    ('OL1751683W', 'Freedom at Midnight', 'Dominique Lapierre, Larry Collins', 'The end of an empire. The birth of two nations.

Seventy years ago, at midnight on August 14, 1947, the Union Jack began its final journey down the flagstaff of Viceroy’s House, New Delhi. A fifth of humanity claimed their independence from the greatest empire history has ever seen—but the price of freedom was high, as a nation erupted into riots and bloodshed, partition and war.

Freedom at Midnight is the true story of the events surrounding Indian independence, beginning with the appointment of Lord Mountbatten of Burma as the last Viceroy of British India, and ending with the assassination and funeral of Mahatma Gandhi. The book was an international bestseller and achieved enormous acclaim in the United States, Italy, Spain, and France.

This edition contains 20 black-and-white photos, five maps, a full bibliography, extensive notes, and a dedication from Dominique Lapierre to the memory of his longtime writing partner Larry Collins.', 'History', 'https://covers.openlibrary.org/b/id/4410-L.jpg', 1975),
    ('OL307247W', 'Bumi Manusia', 'Pramoedya Ananta Toer', NULL, 'History', 'https://covers.openlibrary.org/b/id/6643692-L.jpg', 1972),
    ('OL17917961W', '21 Lessons for the 21st Century', 'Yuval Noah Harari', 'In a world deluged by irrelevant information, clarity is power. Censorship works not by blocking the flow of information, but rather by flooding people with disinformation and distractions. 21 Lessons for the 21st Century cuts through these muddy waters and confronts some of the most urgent questions on today’s global agenda.

Why is liberal democracy in crisis? Is God back? Is a new world war coming? What does the rise of Donald Trump signify? What can we do about the epidemic of fake news? Which civilisation dominates the world – the West, China, Islam? Should Europe keep its doors open to immigrants? Can nationalism solve the problems of inequality and climate change? What should we do about terrorism? What should we teach our kids?

Billions of us can hardly afford the luxury of investigating these questions, because we have more pressing things to do: we have to go to work, take care of the kids, or look after elderly parents. Unfortunately, history makes no concessions. If the future of humanity is decided in your absence, because you are too busy feeding and clothing your kids – you and they will not be exempt from the consequences. This is very unfair; but who said history was fair?

A book doesn’t give people food or clothes – but it can offer some clarity, thereby helping to level the global playing field. If this book empowers even a handful of people to join the debate about the future of our species, it has done its job.', 'History', 'https://covers.openlibrary.org/b/id/10108277-L.jpg', 2018),
    ('OL686193W', 'The story of art', 'E. H. Gombrich', 'The Story of Art, by E. H. Gombrich, is a survey of the history of art from ancient times to the modern era. First published in 1950 by Phaidon, the book is widely regarded both as a seminal work of criticism and as one of the most accessible introductions to the visual arts', 'History', 'https://covers.openlibrary.org/b/id/538390-L.jpg', 1950),
    ('OL39379W', 'A Room of One''s Own', 'Virginia Woolf', 'A Room of One''s Own is an extended essay by Virginia Woolf. First published on 24 October 1929, the essay was based on a series of lectures she delivered at Newnham College and Girton College, two women''s colleges at Cambridge University in October 1928. While this extended essay in fact employs a fictional narrator and narrative to explore women both as writers of and characters in fiction, the manuscript for the delivery of the series of lectures, titled "Women and Fiction", and hence the essay, are considered non-fiction. The essay is generally seen as a feminist text, and is noted in its argument for both a literal and figural space for women writers within a literary tradition dominated by patriarchy.', 'History', 'https://covers.openlibrary.org/b/id/6559057-L.jpg', 1929),
    ('OL3477033W', 'A history of the modern world', 'R. R. Palmer, Palmer, Joel G. Colton', 'Conceived and written as a history of the modern world rather than a truncated Western Civilization book, this text is one of the most highly praised history texts ever published. It has been adopted at more than 1000 schools and has been translated into six languages. Lloyd Kramer joins the author team for this ninth edition that includes two new color inserts highlighting fine art, additional pedagogy to guide students through challenging material, and full, up-to-date inclusion of current events.
First published in 1950, translated into six languages, is used in more than 1,000 colleges and universities as well as many high school advanced placement courses. The second edition (1956), comprises two volumes, 20 main chapters and 110 sub-chapters. The author focuses on World History from a European perspective, and the newer editions also exists under the title "A History of Europe in the Modern World".

First book
The Ancient Greece to 1848

Chapter 1 - Birth of Europe
1. Ancient Greece, Rome and Christianity, p. 3
2. Early Middle Ages, Forming of Europe, p. 10
3. High Middle Ages, Profane culture, p. 18
4. High Middle Ages, the Church, p. 29

Chapter 2 - The Upheaval within the Christian Church 1300 - 1560
5. Decay of the Church, p. 39
6. The Renaissance in Italy, p. 44
7. The Renaissance outside Italy, p. 52
8. The new Monarchies, p. 54
9. Protestantism, p. 60
10. Catholic reformation and restructure, p. 73

Chapter 3 - The Religious Wars 1560 - 1648
11. Opening of the Atlantic Ocean, p. 81
12. The Commercial Revolution, p. 85
13. The Spanish Inquisition; the Dutch and the English, p. 95
14. France''s decomposition and reconstruction, p. 104
15. The thirty-year war; Germany''s decay, p. 111

Chapter 4 - Western Europe in Leadership Position
16. The Great Monarch and the Balance in Europe, p. 121
17. The Dutch Republic, p. 124
18. England: the Puritan Republic, p. 129
19. England: the Triumph of the Parliament, p. 136
20. Louis XIV''s France 1643-1715; the Triumph of Absolutism, p. 142
21. Louis XIV''s War; Treaty of Utrecht, p. 152

Chapter 5 - Transformation of Eastern Europe 1648 - 1740
22. Three aging values, p. 159
23. Arising of the Austrian Monarchy, p. 170
24. Origin of Prussia, p. 175
25. Russia''s Transforming into Western Values, p. 175
26. Poland''s divisions, p. 195

Chapter 6 - The Struggle for Wealth and Power
27. The World''s Housekeeping during the 18th Century, p. 200
28. Western Europe after Utrecht, p. 209
29. The Big War in the middle of the 18th Century, p. 219

Chapter 7 - The Scientific perspective of the World
30. The Prophets of Scientific Culture - Bacon and Descartes, p. 234
31. The Road to Newton: Law of Gravitation, p. 239
32. Expanded Knowledge of the Human Being and Society, p. 247
33. Political Theory: the Natural Law School, p. 254

Chapter 8 - Age of Enlightenment
34. "The Philosophers", p. 261
35. Enlightened Despotism, France, Austria, Pussia, p. 272
36. Enlightened Despotism, Russia, p. 282
37. The American Revolution, p. 289

Chapter 9 - The French Revolution
38. Preconditions, p. 303
39. The Revolution 1789, p. 307
40. The French Unity, p. 315
41. The Revolution and Europe: The War and the "second" revolution 1792, p. 320
42. The French Remodeling of Society, p. 315
43. Republican Crisis 1792-95: Reign of Terror, p. 325
44. The Despotic Republic 1799-1804, p. 337

Chapter 10 - The Napoleonic Europe
45. The Creation of the French Empire, p. 345
46. The large Empire: the Propagation of the Revolution, p. 354
47. The Continental System: Britain and Europe, p. 359
48. The National Movements: Germany, p. 364
49. Napoleon defeated: The Vienna Congress, p. 372

Chapter 11 - Reaction versus progress 1815 - 1848
50. The Industrial Revolution, p. 384
51. Origin of the new Ideologies, p. 391
52. The Dam of the River: Domestic Politics, p. 403
53. The Breakthrough of Liberalism in the West: The Revolutions 1830-32, p. 413
54. The triumph of Western Bourgeois, p. 423

Second book
The 1848 Revolutions to the Second World War and its aftermath

Chapter 12 - 1848: An interrupted Revolution
56: Paris: the Ghost of Western Social Revolutions, p. 2
57: Vienna: the National Revolution in Central Europe, p. 9
58: Frankfurt and Berlin: the Question of a Liberal Europe, p. 17
59: The Consequences of the 1848 Revolutions: the hard Objectivity, p. 24
60: Birth of Marxism, p. 27
61: Bonaparteism: The Second French Empire 1852-70, p. 33

Chapter 13 - Consolidation of the large Countries
62: Background: the idea of National States, p. 39
63: Cavour and the Italian War 1859: Italy''s Unification, p. 42
64: Bismarck: the Foundation of the German Empire, p. 47
65: The Double Monarchy Austria-Hungary, p. 56
66: Liberalisation of Tsar-Russia: Alexander II, p. 60
67: United States: The Civil War, p. 65
68: Dominion Canada 1867, p. 71
69: Japan versus the West, p. 74

Chapter 14 - The European Civilizatio…', 'History', 'https://covers.openlibrary.org/b/id/6286058-L.jpg', 1950),
    ('OL495659W', 'The Age of Revolution', 'Eric Hobsbawm', '**The Age of Revolution: Europe: 1789–1848** is a book by Eric Hobsbawm, first published in 1962. It is the first in a trilogy of books about "the long 19th century" (coined by Hobsbawm), followed by *The Age of Capital: 1848–1875*, and *The Age of Empire: 1875–1914*. A fourth book, *The Age of Extremes: The Short Twentieth Century, 1914–1991*, acts as a sequel to the trilogy. 

(Source: Wikipedia)', 'History', 'https://covers.openlibrary.org/b/id/4765129-L.jpg', 1962),
    ('OL629052W', 'Manifest der Kommunistischen Partei', 'Karl Marx, Friedrich Engels', 'Available under a Creative Commons Attribution-ShareAlike License:
http://www.marxists.org/archive/marx/works/1848/communist-manifesto/

One of the most influential political tracts ever published this short book succinctly explains the aims and purpose of the Communist League of the 19th century, giving the author’s theories of the class struggle which they assumed would inevitably lead to world wide communism.  

Full text available at Project Gutenberg too:
http://www.gutenberg.org/files/61/61.txt', 'History', 'https://covers.openlibrary.org/b/id/11048623-L.jpg', 1848),
    ('OL1073956W', 'The Lessons of History', 'Will Durant, Ariel Durant, Ni yu ping', 'Written by the authors of the 10 volume *The Story of Civilization*, this short (fewer than 120 pages) work notes "events and comments that might illuminate present affairs, future probabilities, the nature of man, and the conduct of states." Its 13 chapters discuss historiography (what is history), history and the earth, history and biology, race, character, morals, religion, economics, socialism, government, war, growth and decay. The final chapter asks, "Is progress real?"', 'History', 'https://covers.openlibrary.org/b/id/7240225-L.jpg', 1968),
    ('OL296039W', 'The discovery of India', 'Jawaharlal Nehru', 'Walk into the world of India and its civilization as seen by Pandit jawaharlal Nehru, the first prime minister of Independent India', 'History', 'https://covers.openlibrary.org/b/id/128122-L.jpg', 1946),
    ('OL24663287W', 'The Dawn of Everything', 'David Graeber, David Wengrow', 'The renowned activist and public intellectual David Graeber teams up with the professor of comparative archaeology David Wengrow to deliver a trailblazing account of human history, challenging our most fundamental assumptions about social evolution—from the development of agriculture and cities to the emergence of "the state," political violence, and social inequality—and revealing new possibilities for human emancipation

For generations, our remote ancestors have been cast as primitive and childlike—either free and equal innocents, or thuggish and warlike. Civilization, we are told, could be achieved only by sacrificing those original freedoms or, alternatively, by taming our baser instincts. David Graeber and David Wengrow show how such theories first emerged in the eighteenth century as a conservative reaction to powerful critiques of European society posed by Indigenous observers and intellectuals. Revisiting this encounter has startling implications for how we make sense of human history today, including the origins of farming, property, cities, democracy, slavery, and civilization itself.

Drawing on pathbreaking research in archaeology and anthropology, the authors show how history becomes a far more interesting place once we learn to throw off our conceptual shackles and perceive what’s really there. If humans did not spend 95 percent of their evolutionary past in tiny bands of hunter-gatherers, what were they doing all that time? If agriculture, and cities, did not mean a plunge into hierarchy and domination, then what kinds of social and economic organization did they lead to? What was really happening during the periods that we usually describe as the emergence of "the state"? The answers are often unexpected, and suggest that the course of human history may be less set in stone, and more full of playful, hopeful possibilities, than we tend to assume.

The Dawn of Everything fundamentally transforms our understanding of the human past and offers a path toward imagining new forms of freedom, new ways of organizing society. This is a monumental book of formidable intellectual range, animated by curiosity, moral vision, and a faith in the power of direct action.', 'History', 'https://covers.openlibrary.org/b/id/11359192-L.jpg', 2021),
    ('OL17641518W', 'ההיסטוריה של המחר', 'Yuval Noah Harari', NULL, 'History', 'https://covers.openlibrary.org/b/id/7914168-L.jpg', 2015),
    ('OL176193W', 'The Unfinished Nation', 'Alan Brinkley', NULL, 'History', 'https://covers.openlibrary.org/b/id/4948125-L.jpg', 1993),
    ('OL2024851W', 'The Enduring Vision', 'Paul S. Boyer', 'Widely admired for its outstanding scholarship and engaging narrative, The Enduring Vision integrates political, social, and cultural history within a clear chronological framework. It was the first U.S. history textbook to incorporate sustained attention to cultural history, the West, and the environment. The Fifth Edition maintains these strengths as well as the book''s distinctive focus on the enduring vision of the American people, "the determination to live up to the values that give meaning to America." - Back cover.', 'History', 'https://covers.openlibrary.org/b/id/8237922-L.jpg', 1987),
    ('OL3900754W', 'Art', 'Frederick Hartt, Rosenthal', 'With authority and insight, gained from over 50 years as a teacher and scholar, Professor Hartt traces the course of western art from the Old Stone Age to the present. Coverage of the 20th century has been extensively updated. 1,412 illustrations, 360 in full color.', 'History', 'https://covers.openlibrary.org/b/id/6793480-L.jpg', 1969),
    ('OL1088357W', 'A History of Western Philosophy', 'Bertrand Russell', '[The author''s] purpose is to exhibit philosophy as an integral part of social and political life: not as the isolated speculations of remarkable individuals, but as both an effect and a cause of the character of the various communities in which different systems flourished.-Pref.', 'History', 'https://covers.openlibrary.org/b/id/405359-L.jpg', 1945),
    ('OL1847023W', 'The worldly philosophers', 'Robert L. Heilbroner', '"The Worldly Philosophers is a bestselling classic that not only enables us to see more deeply into our history but helps us better understand our own times. In this seventh edition, Robert L. Heilbroner provides a view theme that connects thinkers as diverse as Adam Smith and Karl Marx. The theme is the common focus of their highly varied ideas - namely, the search to understand how a capitalist society works."--BOOK JACKET.', 'History', 'https://covers.openlibrary.org/b/id/15106531-L.jpg', 1953),
    ('OL1894813W', 'Postwar', 'Tony Judt', 'The first truly European history of contemporary Europe, from Lisbon to Leningrad, based on research in six languages, covering 34 countries across 60 years, using a great deal of material from newly available sources. The book integrates international relations, domestic politics, ideas, social change, economic development, and culture--high and low--into a single grand narrative. Every country has its chance to play the lead, and although the big themes are handled--including the cold war, the love/hate relationship with America, cultural and economic malaise and rebirth, and the myth and reality of unification--none of them is allowed to overshadow the rich pageant that is the whole.--From publisher description.', 'History', 'https://covers.openlibrary.org/b/id/111385-L.jpg', 2005),
    ('OL1105382W', 'La conquête du pain', 'Peter Kropotkin', '**The Conquest of Bread** (French: *La Conquête du Pain*; Russian: Хлѣбъ и воля, tr. Khleb i volja, "Bread and Freedom"; Хлеб и воля in contemporary spelling), also known colloquially as **The Bread Book**, is an 1892 book by the Russian anarcho-communist Peter Kropotkin. Originally written in French, it first appeared as a series of articles in the anarchist journal Le Révolté. It was first published in Paris with a preface by Élisée Reclus, who also suggested the title. Between 1892 and 1894, it was serialized in part in the London journal Freedom, of which Kropotkin was a co-founder.

In the work, Kropotkin points out what he considers to be the defects of the economic systems of feudalism and capitalism and why he believes they thrive on and maintain poverty and scarcity. He goes on to propose a more decentralized economic system based on mutual aid and voluntary cooperation, asserting that the tendencies for this kind of organization already exist, both in evolution and in human society.

The Conquest of Bread has become a classic of political anarchist literature. It was heavily influential on both the Spanish Civil War and the Occupy movement.

(Source: Wikipedia)', 'History', 'https://covers.openlibrary.org/b/id/7296134-L.jpg', 1892),
    ('OL13015026W', 'An echo in the darkness', 'Francine Rivers', 'This classic series has inspired over half a million readers. Turning away from the opulence of Rome, Marcus is led by a whispering voice from the past into a journey that could set him free from the darkness of his soul.

A prosperous trader, Marcus Lucianus Valerian has made a fortune providing sand and slaves for the Roman games. But Hadassah, a slave in his family''s household, has enchanted him with her quiet beauty and her staunch faith in Christ. When Marcus'' sister sends Hadassah to almost certain death in the games, Marcus feels that his life has been ripped apart. Now he is on his way to Jerusalem to find out more about Hadassah''s god, unaware that a miracle awaits him back in Rome.', 'History', 'https://covers.openlibrary.org/b/id/9157775-L.jpg', 1994),
    ('OL276558W', 'Guns, Germs, and Steel', 'Jared Diamond', 'An epic detective story that offers a gripping expose on why the world is so unequal. Professor Jared Diamond traveled the globe for over 30 years trying to answer this question.', 'History', 'https://covers.openlibrary.org/b/id/7884018-L.jpg', 1997),
    ('OL29921W', 'Art history', 'Marilyn Stokstad, Margaret A. Oppenheimer', 'In tune with today''s readers–rich but never effete–this is the art history book of choice for a new generation. Presenting a broad view of art through the centuries, it sympathetically and positively introduces the works of all artists. This includes women, artists of color, and the arts of other continents and regions, as well as those of Western Europe and the United States. The new edition contains even more full-color reproductions, larger images, redrawn maps and timelines, and new photographs and higher quality images. Balancing both the traditions of art history and new trends of the present, Art History is the most comprehensive, accessible, and magnificently illustrated work of its kind. Broad in scope and depth, this beautifully illustrated work features art from the following time periods and places: prehistoric art in Europe; ancient art of the Near East, Egypt, the Aegean, and Greece; Roman and Etruscan art; Jewish, early Christian, and Byzantine art; Islamic art; art from ancient India, China, Japan, and the Americas; medieval art in Europe; Romanesque, Gothic, and Renaissance art; Baroque art; art of the Pacific cultures; the rise of modern art; and the international Avant-Garde since 1945. An excellent reference work and beautiful edition for any visual artist.', 'History', 'https://covers.openlibrary.org/b/id/596109-L.jpg', 1995),
    ('OL1968368W', 'The 48 Laws of Power', 'Robert Greene', 'Amoral, cunning, ruthless, and instructive, this piercing work distills three thousand years of the history of power in to forty-eight well explicated laws. As attention--grabbing in its design as it is in its content, this bold volume outlines the laws of power in their unvarnished essence, synthesizing the philosophies of Machiavelli, Sun-tzu, Carl von Clausewitz, and other great thinkers. Some laws teach the need for prudence ("Law 1: Never Outshine the Master"), the virtue of stealth ("Law 3: Conceal Your Intentions"), and many demand the total absence of mercy ("Law 15: Crush Your Enemy Totally"), but like it or not, all have applications in real life. Illustrated through the tactics of Queen Elizabeth I, Henry Kissinger, P. T. Barnum, and other famous figures who have wielded--or been victimized by--power, these laws will fascinate any reader interested in gaining, observing, or defending against ultimate control.', 'History', 'https://covers.openlibrary.org/b/id/6424160-L.jpg', 1998),
    ('OL15678068W', 'Ἱστορίαι', 'Ἡρόδοτος', 'One of the earliest histories of the western world still extant, this gives a contemporary account of the Greco-Persian wars of the fifth century BCE with the rise of the Achaemenid Empire under Cyrus the Great.', 'History', 'https://covers.openlibrary.org/b/id/9829028-L.jpg', 1494),
    ('OL74123W', 'A Walk in the Woods', 'Bill Bryson', 'Bill Bryson describes his attempt to walk the Appalachian Trail with his friend "Stephen Katz". The book is written in a humorous style, interspersed with more serious discussions of matters relating to the trail''s history, and the surrounding sociology, ecology, trees, plants, animals and people.', 'History', 'https://covers.openlibrary.org/b/id/12722649-L.jpg', 1997),
    ('OL74128W', 'A short history of nearly everything', 'Bill Bryson', 'A Short History of Nearly Everything by American author Bill Bryson is a popular science book that explains some areas of science, using easily accessible language that appeals more so to the general public than many other books dedicated to the subject. It was one of the bestselling popular science books of 2005 in the United Kingdom, selling over 300,000 copies.

A Short History deviates from Bryson''s popular travel book genre, instead describing general sciences such as chemistry, paleontology, astronomy, and particle physics. In it, he explores time from the Big Bang to the discovery of quantum mechanics, via evolution and geology.

Bill Bryson wrote this book because he was dissatisfied with his scientific knowledge—that was, not much at all. He writes that science was a distant, unexplained subject at school. Textbooks and teachers alike did not ignite the passion for knowledge in him, mainly because they never delved in the whys, hows, and whens.

The ebook can be found elsewhere on the web at:
http://www.huzheng.org/bookstore/AShortHistoryofNearlyEverything.pdf', 'History', 'https://covers.openlibrary.org/b/id/12725620-L.jpg', 2003),
    ('OL296153W', 'Letters from a father to his daughter', 'Jawaharlal Nehru', 'Nehruji has described in simple language the history of civilization. It answers a child''s question that where do we come from? Who were our ancestors? How the languages originated? How religion started? How kings and kingdoms came into existence? What were the early civilizations like? It is an interesting book with interesting sketches. A must read for children.', 'History', 'https://covers.openlibrary.org/b/id/8210996-L.jpg', 1930),
    ('OL1968364W', 'The Art of Seduction', 'Robert Greene', 'This mesmerizing exploration of the most subtle, elusive, and effective form of power is a masterful analysis of civilization''s greatest seducers, from Cleopatra to JFK, as well as the classic literature of seduction from Freud to Kierkegaard and Ovid to Casanova. Robert Greene once again identifies the rules of a timeless, amoral game and explores how to cast a spell, break down resistance, and, ultimately, compel a target to surrender. Presenting the timeless profiles of each type of seducer and the twenty-four maneuvers that will guide you step by step in the game of seduction, The Art of Seduction is an indispensable primer of persuasion that reveals the timeless power of this age-old art.', 'History', 'https://covers.openlibrary.org/b/id/917840-L.jpg', 2001),
    ('OL1926995W', 'The Palace of Illusions', 'Chitra Banerjee Divakaruni', 'A reimagining of the world-famous Indian epic, the Mahabharat--told from the point of view of the wife of an amazing woman.Relevant to today''s war-torn world, The Palace of Illusions takes us back to a time that is half history, half myth, and wholly magical. Narrated by Panchaali, the wife of the legendary Pandavas brothers in the Mahabharat, the novel gives us a new interpretation of this ancient tale. The novel traces the princess Panchaali''s life, beginning with her birth in fire and following her spirited balancing act as a woman with five husbands who have been cheated out of their father''s kingdom. Panchaali is swept into their quest to reclaim their birthright, remaining at their side through years of exile and a terrible civil war involving all the important kings of India. Meanwhile, we never lose sight of her strategic duels with her mother-in-law, her complicated friendship with the enigmatic Krishna, or her secret attraction to the mysterious man who is her husbands'' most dangerous enemy. Panchaali is a fiery female redefining for us a world of warriors, gods, and the ever-manipulating hands of fate.', 'History', 'https://covers.openlibrary.org/b/id/2412074-L.jpg', 2008),
    ('OL19666939W', 'The Silk Roads', 'Peter Frankopan', '"Our world was made on and by the Silk Roads. For millennia it was here that East and West encountered each other through trade and conquest, leading to the spread of ideas and cultures, the birth of the world''s great religions, the appetites for foreign goods that drove economies and the growth of nations. From the first cities in Mesopotamia to the growth of Greece and Rome to the depredations by the Mongols and the Black Death to the Great Game and the fall of Communism, the fate of the West has always been inextricably linked to the East. The Silk Roads vividly captures the importance of the networks that crisscrossed the spine of Asia and linked the Atlantic with the Pacific, the Mediterranean with India, America with the Persian Gulf. By way of events as disparate as the American Revolution and the horrific world wars of the twentieth century, Peter Frankopan realigns the world, orientating us eastwards, and illuminating how even the rise of the West 500 years ago resulted from its efforts to gain access to and control these Eurasian trading networks. In an increasingly globalized planet, where current events in Asia and the Middle East dominate the world''s attention, this magnificent work of history is very much a work of our times"--', 'History', 'https://covers.openlibrary.org/b/id/8963642-L.jpg', 2015),
    ('OL4289172W', 'Traditions & encounters', 'Jerry H. Bentley, Herbert Ziegler, Herbert F. Ziegler', 'Traditions & Encounters: A Brief Global History brings focus to the human experience. It turns the story of world history into a cohesive narrative by putting events into perspective and creating a framework for cross-cultural comparisons. It tells the story of people in history, the traditions they embraced, and the encounters with other cultures that brought about inevitable change. - Back cover.', 'History', 'https://covers.openlibrary.org/b/id/65184-L.jpg', 1999),
    ('OL1719867W', 'History of art', 'H. W. Janson, H.W Janson, H. W Janson', 'Added to the Fifth Edition Revised are more than forty concise discussions of cultural developments paralleling movements in art, from ancient Greek times through our own Postmodern era. These masterly essays focus mainly on music and theater, and also include such topics as Greek and Roman mythology, Christian iconography, Western monastic orders, and medieval guilds. These new features enrich the updated and reworked text and the 115 primary-source readings that are unique to History of Art.', 'History', 'https://covers.openlibrary.org/b/id/10075231-L.jpg', 1962),
    ('OL17340134W', 'SPQR', 'Mary Beard, Silvia Furió', '"Ancient Rome matters. Its history of empire, conquest, cruelty and excess is something against which we still judge ourselves. Its myths and stories - from Romulus and Remus to the Rape of Lucretia - still strike a chord with us. And its debates about citizenship, security and the rights of the individual still influence our own debates on civil liberty today. SPQR is a new look at Roman history from one of the world''s foremost classicists. It explores not only how Rome grew from an insignificant village in central Italy to a power that controlled territory from Spain to Syria, but also how the Romans thought about themselves and their achievements, and why they are still important to us. Covering 1,000 years of history, and casting fresh light on the basics of Roman culture from slavery to running water, as well as exploring democracy, migration, religious controversy, social mobility and exploitation in the larger context of the empire, this is a definitive history of ancient Rome. SPQR is the Romans'' own abbreviation for their state: Senatus Populusque Romanus, ''the Senate and People of Rome''"--Jacket.', 'History', 'https://covers.openlibrary.org/b/id/7418788-L.jpg', 2015),
    ('OL78871W', 'Twelve years a slave', 'Solomon Northup', 'Twelve Years a Slave is a harrowing memoir about one of the darkest periods in American history. It recounts how Solomon Northup, born a free man in New York, was lured to Washington, D.C., in 1841 with the promise of fast money, then drugged and beaten and sold into slavery. He spent the next twelve years of his life in captivity on a Louisiana cotton plantation.', 'History', 'https://covers.openlibrary.org/b/id/14856045-L.jpg', 1853),
    ('OL106813W', 'Lies My Teacher Told Me', 'James W. Loewen', 'Since its first publication in 1995, Lies My Teacher Told Me has gone on to win an American Book Award, the Oliver Cromwell Cox Award for Distinguished Anti-Racist Scholarship, and to sell over half a million copies in its various editions. What started out as a survey of the twelve leading American history textbooks has ended up being what the San Francisco Chronicle calls "an extremely convincing plea for truth in education." In Lies My Teacher Told Me, James W. Loewen brings history alive in all its complexity and ambiguity. Beginning with pre-Columbian history and ranging over characters and events as diverse as Reconstruction, Helen Keller, the first Thanksgiving, and the Mai Lai massacre, Loewen offers an eye-opening critique of existing textbooks, and a wonderful retelling of American history as it should -- and could -- be taught to American students. - Publisher.', 'History', 'https://covers.openlibrary.org/b/id/804808-L.jpg', 1994),
    ('OL1629183W', 'History of the Filipino People', 'Teodoro A. Agoncillo', 'Comprehensive overview of Philippine History including Pre-Spanish life and culture, Spanish rule, the Filipino -American War, American rule, and the campaign for Independence, among other subjects.', 'History', 'https://covers.openlibrary.org/b/id/6682021-L.jpg', 1969),
    ('OL863779W', 'Letters on demonology and witchcraft', 'Sir Walter Scott', NULL, 'History', 'https://covers.openlibrary.org/b/id/5645404-L.jpg', 1830),
    ('OL3378547W', 'A Distant Mirror', 'Barbara Tuchman', 'Amazon.com Review

In this sweeping historical narrative, Barbara Tuchman writes of the cataclysmic 14th century, when the energies of medieval Europe were devoted to fighting internecine wars and warding off the plague. Some medieval thinkers viewed these disasters as divine punishment for mortal wrongs; others, more practically, viewed them as opportunities to accumulate wealth and power. One of the latter, whose life informs much of Tuchman''s book, was the French nobleman Enguerrand de Coucy, who enjoyed the opulence and elegance of the courtly tradition while ruthlessly exploiting the peasants under his thrall. Tuchman looks into such events as the Hundred Years War, the collapse of the medieval church, and the rise of various heresies, pogroms, and other events that caused medieval Europeans to wonder what they had done to deserve such horrors.', 'History', 'https://covers.openlibrary.org/b/id/5071195-L.jpg', 1600),
    ('OL74126W', 'The Mother Tongue', 'Bill Bryson', NULL, 'History', 'https://covers.openlibrary.org/b/id/12857063-L.jpg', 1656),
    ('OL1285005W', 'History of the Decline and Fall of the Roman Empire Complete and Unabridged', 'Edward Gibbon', 'Gibbon''s masterpiece, which narrates the history of the Roman Empire from the second century a.d. to its collapse in the west in the fifth century and in the east in the fifteenth century, is widely considered the greatest work of history ever written. This abridgment retains the full scope of the original, but in a compass equivalent to a long novel. Casual readers now have access to the full sweep of Gibbon''s narrative, while instructors and students have a volume that can be read in a single term. This unique edition emphasizes elements ignored in all other abridgments--in particular the role of religion in the empire and the rise of Islam.From the Trade Paperback edition.', 'History', 'https://covers.openlibrary.org/b/id/5978577-L.jpg', 1776),
    ('OL1037811W', 'Wings of Fire', 'A. P. J. Abdul Kalam', 'Avul Pakir Jainulabdeen Abdul Kalam, the son of a little-educated boat-owner in Rameswaram, Tamil Nadu, had an unparalleled career as a defence scientist, culminating in the highest civilian award of India, the Bharat Ratna. As chief of the country’s defence research and development programme, Kalam demonstrated the great potential for dynamism and innovation that existed in seemingly moribund research establishments. This is the story of Kalam’s rise from obscurity and his personal and professional struggles, as well as the story of Agni, Prithvi, Akash, Trishul and Nag—missiles that have become household names in India and that have raised the nation to the level of a missile power of international reckoning. This is also the saga of independent India’s struggle for technological self-sufficiency and defensive autonomy—a story as much about politics, domestic and international, as it is about science.', 'Biography', 'https://covers.openlibrary.org/b/id/9153819-L.jpg', 1999),
    ('OL528094W', 'Autobiography of a Yogi', 'Yogananda Paramahansa', 'The autobiography of Paramahansa Yogananda (1893 - 1952) details his search for a guru, during which he encountered many spiritual leaders and world-renowned scientists. When it was published in 1946 it was the first introduction of many westerners to yoga and meditation.The famous opera singer Amelita Galli-Curci said about the book:"Amazing, true stories of saints and masters of India, blended with priceless superphysical information-much needed to balance the Western material efficiency with Eastern spiritual efficiency-come from the vigorous pen of Paramhansa Yogananda, whose teachings my husband and myself have had the pleasure of studying for twenty years."', 'Biography', 'https://covers.openlibrary.org/b/id/805448-L.jpg', 1946),
    ('OL26663382W', 'I''m Glad My Mom Died', 'Jennette McCurdy', 'A heartbreaking and hilarious memoir by iCarly and Sam & Cat star Jennette McCurdy about her struggles as a former child actor—including eating disorders, addiction, and a complicated relationship with her overbearing mother—and how she retook control of her life.

Jennette McCurdy was six years old when she had her first acting audition. Her mother’s dream was for her only daughter to become a star, and Jennette would do anything to make her mother happy. So she went along with what Mom called “calorie restriction,” eating little and weighing herself five times a day. She endured extensive at-home makeovers while Mom chided, “Your eyelashes are invisible, okay? You think Dakota Fanning doesn’t tint hers?” She was even showered by Mom until age sixteen while sharing her diaries, email, and all her income.

In I’m Glad My Mom Died , Jennette recounts all this in unflinching detail—just as she chronicles what happens when the dream finally comes true. Cast in a new Nickelodeon series called iCarly , she is thrust into fame. Though Mom is ecstatic, emailing fan club moderators and getting on a first-name basis with the paparazzi (“Hi Gale!”), Jennette is riddled with anxiety, shame, and self-loathing, which manifest into eating disorders, addiction, and a series of unhealthy relationships. These issues only get worse when, soon after taking the lead in the iCarly spinoff Sam & Cat alongside Ariana Grande, her mother dies of cancer. Finally, after discovering therapy and quitting acting, Jennette embarks on recovery and decides for the first time in her life what she really wants.

Told with refreshing candor and dark humor, I’m Glad My Mom Died is an inspiring story of resilience, independence, and the joy of shampooing your own hair.', 'Biography', 'https://covers.openlibrary.org/b/id/12855985-L.jpg', 2022),
    ('OL27294413W', 'The Diary of a Young Girl- Anne Frank', 'Anne Frank', 'The Diary of a Young Girl, also known as The Diary of Anne Frank, is a book of the writings from the Dutch-language diary kept by Anne Frank while she was in hiding for two years with her family during the Nazi occupation of the Netherlands. The family was apprehended in 1944, and Anne Frank died of typhus in the Bergen-Belsen concentration camp in 1945. Anne''s diaries were retrieved by Miep Gies and Bep Voskuijl. Miep gave them to Anne''s father, Otto Frank, the family''s only survivor, just after the Second World War was over.', 'Biography', 'https://covers.openlibrary.org/b/id/13526331-L.jpg', 2001),
    ('OL18139176W', 'Educated', 'Tara Westover, Orah Danḳner', '*Educated* is a 2018 memoir by the American author Tara Westover. Westover recounts overcoming her survivalist Mormon family in order to go to college, and emphasizes the importance of education in enlarging her world. She details her journey from her isolated life in the mountains of Idaho to completing a PhD program in history at Cambridge University. She started college at the age of 17 having had no formal education. She explores her struggle to reconcile her desire to learn with the world she inhabited with her father.', 'Biography', 'https://covers.openlibrary.org/b/id/8314077-L.jpg', 2018),
    ('OL158041W', 'Fear and Loathing in Las Vegas', 'Hunter S. Thompson', 'Maverick author Hunter S. Thompson introduced the world to "gonzo journalism" with this cult classic that shot back up the best seller lists after Thompson''s suicide in 2005. No book ever written has more perfectly captured the spirit of the 1960s counterculture. In Las Vegas to cover a motorcycle race, Raoul Duke (Thompson) and his attorney Dr. Gonzo (inspired by a friend of Thompson) are quickly diverted to search for the American dream. Their quest is fueled by nearly every drug imaginable and quickly becomes a surreal experience that blurs the line between reality and fantasy. But there is more to this hilarious tale than reckless behavior, for underneath the hallucinogenic facade is a stinging criticism of American greed and consumerism.', 'Biography', 'https://covers.openlibrary.org/b/id/13396-L.jpg', 1971),
    ('OL69178W', 'Narrative of the life of Frederick Douglass', 'Frederick Douglass', 'This book is an autobiographical account by runaway slave Frederick Douglass that chronicles his experiences with his owners and overseers and discusses how slavery affected both slaves and slaveholders.', 'Biography', 'https://covers.openlibrary.org/b/id/8247724-L.jpg', 1845),
    ('OL2625422W', '走ることについて語るときに僕の語ること', '村上春樹', 'In 1982, having sold his jazz bar to devote himself to writing, Murakami began running to keep fit. A year later, he''d completed a solo course from Athens to Marathon, and now, after dozens of such races, not to mention triathlons and a dozen critically acclaimed books, he reflects upon the influence the sport has had on his life and--even more important--on his writing.Equal parts training log, travelogue, and reminiscence, this revealing memoir covers his four-month preparation for the 2005 New York City Marathon and takes us to places ranging from Tokyo''s Jingu Gaien gardens, where he once shared the course with an Olympian, to the Charles River in Boston among young women who outpace him. Through this marvelous lens of sport emerges a panorama of memories and insights: the eureka moment when he decided to become a writer, his greatest triumphs and disappointments, his passion for vintage LPs, and the experience, after fifty, of seeing his race times improve and then fall back.By turns funny and sobering, playful and philosophical, What I Talk About When I Talk About Running is rich and revelatory, both for fans of this masterful yet guardedly private writer and for the exploding population of athletes who find similar satisfaction in running.From the Hardcover edition.', 'Biography', 'https://covers.openlibrary.org/b/id/7167416-L.jpg', 2006),
    ('OL20715162W', 'Persepolis 1 & 2', 'Marjane Satrapi', 'Wise, funny, and heartbreaking, Persepolis is Marjane Satrapi’s memoir of growing up in Iran during the Islamic Revolution. In powerful black-and-white comic strip images, Satrapi tells the story of her life in Tehran from ages six to fourteen, years that saw the overthrow of the Shah’s regime, the triumph of the Islamic Revolution, and the devastating effects of war with Iraq. The intelligent and outspoken only child of committed Marxists and the great-granddaughter of one of Iran’s last emperors, Marjane bears witness to a childhood uniquely entwined with the history of her country.

Persepolis paints an unforgettable portrait of daily life in Iran and of the bewildering contradictions between home life and public life. Marjane’s child’s-eye view of dethroned emperors, state-sanctioned whippings, and heroes of the revolution allows us to learn as she does the history of this fascinating country and of her own extraordinary family. Intensely personal, profoundly political, and wholly original, Persepolis is at once a story of growing up and a reminder of the human cost of war and political repression. It shows how we carry on, with laughter and tears, in the face of absurdity. And, finally, it introduces us to an irresistible little girl with whom we cannot help but fall in love.', 'Biography', 'https://covers.openlibrary.org/b/id/12648909-L.jpg', 2003),
    ('OL15474046W', 'Just Kids', 'Patti Smith, Patti Smith', 'In this memoir, singer-songwriter Patti Smith shares tales of New York City : the denizens of Max''s Kansas City, the Hotel Chelsea, Scribner''s, Brentano''s and Strand bookstores and her new life in Brooklyn with a young man named Robert Mapplethorpe--the man who changed her life with his love, friendship, and genius.', 'Biography', 'https://covers.openlibrary.org/b/id/6671097-L.jpg', 2006),
    ('OL17824318W', 'Born a Crime', 'Trevor Noah', 'Born a Crime is the story of a mischievous young boy who grows into a restless young man as he struggles to find himself in a world where he was never supposed to exist. It is also the story of that young man’s relationship with his fearless, rebellious, and fervently religious mother—his teammate, a woman determined to save her son from the cycle of poverty, violence, and abuse that would ultimately threaten her own life.

The stories collected here are by turns hilarious, dramatic, and deeply affecting. Whether subsisting on caterpillars for dinner during hard times, being thrown from a moving car during an attempted kidnapping, or just trying to survive the life-and-death pitfalls of dating in high school, Trevor illuminates his curious world with an incisive wit and unflinching honesty. His stories weave together to form a moving and searingly funny portrait of a boy making his way through a damaged world in a dangerous time, armed only with a keen sense of humor and a mother’s unconventional, unconditional love.', 'Biography', 'https://covers.openlibrary.org/b/id/8294078-L.jpg', 2016),
    ('OL17356252W', 'When Breath Becomes Air', 'Paul Kalanithi', 'When Breath Becomes Air is a non-fiction autobiographical book written by American neurosurgeon Paul Kalanithi. It is a memoir about his life and illness, battling stage IV metastatic lung cancer. It was posthumously published by Random House on January 12, 2016.', 'Biography', 'https://covers.openlibrary.org/b/id/11463139-L.jpg', 2016),
    ('OL17184556W', 'Elon Musk', 'Ashlee Vance', 'In the spirit of Steve Jobs and Moneyball, Elon Musk is both an illuminating and authorized look at the extraordinary life of one of Silicon Valley''s most exciting, unpredictable, and ambitious entrepreneurs -- a real-life Tony Stark -- and a fascinating exploration of the renewal of American invention and its new "makers." Elon Musk spotlights the technology and vision of Elon Musk, the renowned entrepreneur and innovator behind SpaceX, Tesla, and SolarCity, who sold one of his Internet companies, PayPal, for $1.5 billion. Ashlee Vance captures the full spectacle and arc of the genius''s life and work, from his tumultuous upbringing in South Africa and flight to the United States to his dramatic technical innovations and entrepreneurial pursuits. Vance uses Musk''s story to explore one of the pressing questions of our age: can the nation of inventors and creators who led the modern world for a century still compete in an age of fierce global competition? He argues that Musk -- one of the most unusual and striking figures in American business history -- is a contemporary, visionary amalgam of legendary inventors and industrialists including Thomas Edison, Henry Ford, Howard Hughes, and Steve Jobs. More than any other entrepreneur today, Musk has dedicated his energies and his own vast fortune to inventing a future that is as rich and far-reaching as the visionaries of the golden age of science-fiction fantasy. Thorough and insightful, Elon Musk brings to life a technology industry that is rapidly and dramatically changing by examining the life of one of its most powerful and influential titans. - Publisher.', 'Biography', 'https://covers.openlibrary.org/b/id/8463846-L.jpg', 2013),
    ('OL3954921W', 'Girl, interrupted', 'Susanna Kaysen', 'In 1967, after a session with a psychiatrist she''d never seen before, eighteen-year-old Susanna Kaysen was put in a taxi and sent to McLean Hospital. She spent most of the next two years on the ward for teenage girls in a psychiatric hospital as renowned for its famous clientele--Sylvia Plath, Robert Lowell, James Taylor, and Ray Charles--as for its progressive methods of treating those who could afford its sanctuary. Kaysen''s memoir encompasses horror and razor-edged perception while providing vivid portraits of her fellow patients and their keepers. It is a brilliant evocation of a "parallel universe" set within the kaleidoscopically shifting landscape of the late sixties. Girl, Interrupted is a clear-sighted, unflinching document that gives lasting and specific dimension to our definitions of sane and insane, mental illness and recovery.', 'Biography', 'https://covers.openlibrary.org/b/id/3956219-L.jpg', 1993),
    ('OL1853064W', 'Pimp', 'Iceberg Slim, Beck, Robert, Irvine Welsh', 'This is the story of Iceberg Slim''s life, as he saw, felt, tasted, and smelled it. A trip through hell by the one man who lived to tell the tale. The dangers of jail, addiction and death that are still all too familiar.', 'Biography', 'https://covers.openlibrary.org/b/id/13539771-L.jpg', 1967),
    ('OL81601W', 'On Writing', 'Stephen King', 'On Writing is both a textbook for writers and a memoir of Stephen''s life and will, thus, appeal even to those who are not aspiring writers. If you''ve always wondered what led Steve to become a writer and how he came to be the success he is today, this will answer those questions.

([source][1])', 'Biography', 'https://covers.openlibrary.org/b/id/9255939-L.jpg', 1999),
    ('OL1933963W', 'Gifted hands', 'Ben Carson, Cecil Murphey, Benjamin S. Carson Sr.', 'In 1987, Dr. Benjamin Carson gained worldwide recognition for his part in the first successful separation of Siamese twins joined at the back of the head. The extremely complex and delicate operation, five months in the planning and twenty-two hours in the execution, involved a surgical plan that Carson helped initiate.  Carson pioneered again in a rare procedure known as hemispherectomy, giving children without hope a second chance at life through a daring operation in which he literally removed one half of their brain.  But such breakthroughs aren''t unusual for Ben Carson. He''s been beating the odds since he was a child.  Raised in inner-city Detroit by a mother with a third grade education, Ben lacked motivation. He had terrible grades. And a pathological temper threatened to put him in jail. But Sonya Carson convinced her son that he could make something of his life, even though everything around him said otherwise.  Trust in God, a relentless belief in his own capabilities, and sheer determination catapulted Ben from failing grades to the top of his class --- and beyond to a Yale scholarship . . . the University of Michigan Medical School . . . and finally, at age 33, the directorship of pediatric neurosurgery at Johns Hopkins Hospital in Baltimore, Maryland. Today, Dr. Ben Carson holds twenty honorary doctorates and is the possessor of a long string of honors and awards, including the Horatio Alger Award, induction into the ''Great Blacks in Wax'' Museum in Baltimore, Maryland, and an invitation as Keynote Speaker at the 1997 President''s National Prayer Breakfast.  Gifted Hands is the riveting story of one man''s secret for success, tested against daunting odds and driven by an incredible mindset that dares to take risks. This inspiring autobiography takes you into the operating room to witness surgeries that made headlines around the world --- and into the private mind of a compassionate, God-fearing physician who lives to help others. Through it all shines a humility, quick wit, and down-to-earth style that make this book one you won''t easily forget.', 'Biography', 'https://covers.openlibrary.org/b/id/4942228-L.jpg', 1990),
    ('OL42308W', 'All Creatures Great and Small (All Creatures Great and Small #1-2)', 'James Herriot', 'Delve into the magical, unforgettable world of James Herriot, the world''s most beloved veterinarian, and his menagerie of heartwarming, funny, and tragic animal patients.

For over forty years, generations of readers have thrilled to Herriot''s marvelous tales, deep love of life, and extraordinary storytelling abilities. For decades, Herriot roamed the remote, beautiful Yorkshire Dales, treating every patient that came his way from smallest to largest, and observing animals and humans alike with his keen, loving eye.

In *All Creatures Great and Small*, we meet the young Herriot as he takes up his calling and discovers that the realities of veterinary practice in rural Yorkshire are very different from the sterile setting of veterinary school. Some visits are heart-wrenchingly difficult, such as one to an old man in the village whose very ill dog is his only friend and companion, some are lighthearted and fun, such as Herriot''s periodic visits to the overfed and pampered Pekinese Tricki Woo who throws parties and has his own stationery, and yet others are inspirational and enlightening, such as Herriot''s recollections of poor farmers who will scrape their meager earnings together to be able to get proper care for their working animals. From seeing to his patients in the depths of winter on the remotest homesteads to dealing with uncooperative owners and critically ill animals, Herriot discovers the wondrous variety and never-ending challenges of veterinary practice as his humor, compassion, and love of the animal world shine forth.

(Printed in the UK as two books: Book #1 - *If Only They Could Talk*, and Book #2 - *It Shouldn’t Happen to a Vet*.)', 'Biography', 'https://covers.openlibrary.org/b/id/6382107-L.jpg', 1972),
    ('OL26864096W', 'Ikigai', 'Chiemi Souen, Flor Kaneshiro', NULL, 'Biography', 'https://covers.openlibrary.org/b/id/13110612-L.jpg', 2021),
    ('OL80021W', 'I Know Why the Caged Bird Sings', 'Maya Angelou', 'She was born Marguerite, but her brother Bailey nicknamed her Maya ("mine"). As little children they were sent to live with their grandmother in Stamps, Arkansas. Their early world revolved around this remarkable woman and the Store she ran for the black community. White people were more than strangers - they were from another planet. And yet, even unseen they ruled. 

The Store was a microcosm of life: its orderly pattern was a comfort, even among the meanest frustrations. But then came the intruders - first in the form of taunting poorwhite children who were bested only by the grandmother''s dignity. But as the awful, unfathomable mystery of prejudice intruded, so did the unexpected joy of a surprise visit by Daddy, the sinful joy of going to Church, the disappointments of a Depression Christmas.

A visit to St. Louis and the Most Beautiful Mother in the World ended in tragedy - rape. Thereafter Maya refused to speak, except to the person closest to her, Bailey. Eventually, Maya and Bailey followed their mother to California. There, the formative phase of her life (as well as this book) comes to a close with the painful discovery of the true nature of her father, the emergence of a hard-won independence and - perhaps most important - a baby, born out of wedlock, loved and kept.

Superbly told, with the poet''s gift for language and observation, and charged with the unforgetable emotion of remembered anguish and love - this remarkable autobiography by an equally remarkable black girl from Arkansas captures, indelibly, a world of which most Americans are shamefully ignorant.', 'Biography', 'https://covers.openlibrary.org/b/id/9367075-L.jpg', 1969),
    ('OL262984W', 'Papillon', 'Henri Charrière', 'Describes the life of a man sent to prison on a miserable island, Cayena, where escape is impossible. It is a terrible life for him but he finally escapes after much suffering.', 'Biography', 'https://covers.openlibrary.org/b/id/8752-L.jpg', 1969),
    ('OL4288870W', 'Einstein', 'Walter Isaacson', 'Albert Einstein''s life and times.', 'Biography', 'https://covers.openlibrary.org/b/id/474440-L.jpg', 2007),
    ('OL18108064W', 'Can''t Hurt Me', 'David Goggins', 'For David Goggins, childhood was a nightmare--poverty, prejudice, and physical abuse colored his days and haunted his nights. But through self-discipline, mental toughness, and hard work, Goggins transformed himself from a depressed, overweight young man with no future into a US Armed Forces icon and one of the world''s top endurance athletes. The only man in history to complete elite training as a Navy SEAL, Army Ranger, and Air Force tactical air controller, he went on to set records in numerous endurance events, inspiring Outside magazine to name him the Fittest (Real) Man in America.

In Can''t Hurt Me, he shares his astonishing life story and reveals that most of us tap into only 40 percent of our capabilities. Goggins calls this The 40% Rule, and his story illuminates a path that anyone can follow to push past pain, demolish fear, and reach their full potential.', 'Biography', 'https://covers.openlibrary.org/b/id/8305903-L.jpg', 2018),
    ('OL847061W', 'Livro do Desassossego', 'Fernando Pessoa', 'The Book of Disquiet is the Portuguese modernist master Fernando Pessoa''s greatest literary achievement. An "autobiography" or "diary" containing exquisite melancholy observations, aphorisms, and ruminations, this classic work grapples with all the eternal questions. Now, for the first time the texts are presented chronologically, in a complete English edition by master translator Margaret Jull Costa. Most of the texts in The Book of Disquiet are written under the semi-heteronym Bernardo Soares, an assistant bookkeeper. This existential masterpiece was first published in Portuguese in 1982, forty-seven years after Pessoa''s death. A monumental literary event, this exciting, new, complete edition spans Fernando Pessoa''s entire writing life. --', 'Biography', 'https://covers.openlibrary.org/b/id/900685-L.jpg', 1982),
    ('OL3348011W', 'Kitchen Confidential', 'Anthony Bourdain', 'A celebrity chef shares anecdotes of his experience in the restaurant industry, and of his journey from dishwasher to a position of fame in the food industry.', 'Biography', 'https://covers.openlibrary.org/b/id/843879-L.jpg', 2000),
    ('OL5110680W', 'Elvis and me', 'Priscilla Beaulieu Presley', 'Elvis and Me is a 1985 biography written by Priscilla Presley with Sandra Harmon. In the book, Priscilla talks about meeting Elvis Presley, their marriage, and the factors and issues that led to the couple''s divorce.', 'Biography', 'https://covers.openlibrary.org/b/id/9736400-L.jpg', 1985),
    ('OL17802920W', 'Leonardo da Vinci', 'Walter Isaacson, Jordi Ainaud i Escudero, Beruryah Ben Barukh', 'The author of the acclaimed bestsellers Steve Jobs, Einstein, and Benjamin Franklin brings Leonardo da Vinci to life in this exciting new biography.

Based on thousands of pages from Leonardo’s astonishing notebooks and new discoveries about his life and work, Walter Isaacson weaves a narrative that connects his art to his science. He shows how Leonardo’s genius was based on skills we can improve in ourselves, such as passionate curiosity, careful observation, and an imagination so playful that it flirted with fantasy.

He produced the two most famous paintings in history, The Last Supper and the Mona Lisa. But in his own mind, he was just as much a man of science and technology. With a passion that sometimes became obsessive, he pursued innovative studies of anatomy, fossils, birds, the heart, flying machines, botany, geology, and weaponry. His ability to stand at the crossroads of the humanities and the sciences, made iconic by his drawing of Vitruvian Man, made him history’s most creative genius.

His creativity, like that of other great innovators, came from having wide-ranging passions. He peeled flesh off the faces of cadavers, drew the muscles that move the lips, and then painted history’s most memorable smile. He explored the math of optics, showed how light rays strike the cornea, and produced illusions of changing perspectives in The Last Supper. Isaacson also describes how Leonardo’s lifelong enthusiasm for staging theatrical productions informed his paintings and inventions.

Leonardo’s delight at combining diverse passions remains the ultimate recipe for creativity. So, too, does his ease at being a bit of a misfit: illegitimate, gay, vegetarian, left-handed, easily distracted, and at times heretical. His life should remind us of the importance of instilling, both in ourselves and our children, not just received knowledge but a willingness to question it—to be imaginative and, like talented misfits and rebels in any era, to think different.', 'Biography', 'https://covers.openlibrary.org/b/id/8087691-L.jpg', 2017),
    ('OL19669045W', 'I am Malala', 'Malala Yousafzai, Christina Lamb, Malala Yousafzai', 'When the Taliban took control of the Swat Valley in Pakistan, one girl spoke out. Malala Yousafzai refused to be silenced and fought for her right to an education. On Tuesday, October 9, 2012, when she was fifteen, she almost paid the ultimate price. She was shot in the head at point-blank range while riding the bus home from school, and few expected her to survive. Instead, Malala''s miraculous recovery has taken her on an extraordinary journey from a remote valley in northern Pakistan to the halls of the United Nations in New York. At sixteen, she has become a global symbol of peaceful protest and the youngest nominee ever for the Nobel Peace Prize. This is the remarkable tale of a family uprooted by global terrorism, of the fight for girls'' education, of a father who, himself a school owner, championed and encouraged his daughter to write and attend school, and of brave parents who have a fierce love for their daughter in a society that prizes sons. This story will make you believe in the power of one person''s voice to inspire change in the world. -- Publisher''s description.', 'Biography', 'https://covers.openlibrary.org/b/id/9358664-L.jpg', 2012),
    ('OL19791590W', 'Maybe You Should Talk to Someone', 'Lori Gottlieb', 'From a New York Times best-selling author, psychotherapist, and national advice columnist, a hilarious, thought-provoking, and surprising new book that takes us behind the scenes of a therapist’s world—where her patients are looking for answers (and so is she).

One day, Lori Gottlieb is a therapist who helps patients in her Los Angeles practice. The next, a crisis causes her world to come crashing down. Enter Wendell, the quirky but seasoned therapist in whose of­fice she suddenly lands. With his balding head, cardigan, and khakis, he seems to have come straight from Therapist Central Casting. Yet he will turn out to be anything but.

As Gottlieb explores the inner chambers of her patients’ lives — a self-absorbed Hollywood producer, a young newlywed diagnosed with a terminal illness, a senior citizen threatening to end her life on her birthday if nothing gets better, and a twenty-something who can’t stop hooking up with the wrong guys — she finds that the questions they are struggling with are the very ones she is now bringing to Wendell.

With startling wisdom and humor, Gottlieb invites us into her world as both clinician and patient, examining the truths and fictions we tell ourselves and others as we teeter on the tightrope between love and desire, meaning and mortality, guilt and redemption, terror and courage, hope and change.

Maybe You Should Talk to Someone is rev­olutionary in its candor, offering a deeply per­sonal yet universal tour of our hearts and minds and providing the rarest of gifts: a boldly reveal­ing portrait of what it means to be human, and a disarmingly funny and illuminating account of our own mysterious lives and our power to transform them.
(source)', 'Biography', 'https://covers.openlibrary.org/b/id/8596019-L.jpg', 2019),
    ('OL29331033W', 'The Woman in Me', 'Britney Spears', 'The Woman in Me is a brave and astonishingly moving story about freedom, fame, motherhood, survival, faith, and hope.

In June 2021, the whole world was listening as Britney Spears spoke in open court. The impact of sharing her voice—her truth—was undeniable, and it changed the course of her life and the lives of countless others. The Woman in Me reveals for the first time her incredible journey—and the strength at the core of one of the greatest performers in pop music history.
 
Written with remarkable candor and humor, Spears’s groundbreaking book illuminates the enduring power of music and love—and the importance of a woman telling her own story, on her own terms, at last.', 'Biography', 'https://covers.openlibrary.org/b/id/14538012-L.jpg', 2023),
    ('OL1857638W', 'The Man Who Loved Only Numbers', 'Paul Hoffman', '"Paul Erdos, the most prolific and eccentric mathematician of our time, forsook all creature comforts - including a hometo pursue his lifelong study of numbers. He was a man who possessed unimaginable powers of thought yet was unable to manage some of the simplest daily tasks." "For more than six decades, Erdos lived out of two tattered suitcases, crisscrossing four continents at a frenzied pace, chasing mathematical problems and fresh talent. Erdos saw mathematics as a search for lasting beauty and ultimate truth. It was a search Erdos never abandoned, even as his life was torn asunder by some of the major political dramas of our time." "In this biography, Hoffman uses Erdos''s life and work to introduce readers to a cast of remarkable geniuses, from Archimedes to Stanislaw Ulam, one of the chief minds behind the Los Alamos nuclear project. He draws on years of interviews with Ronald Graham and Fan Chung, Erdos''s chief American caretakers and devoted collaborators. With an eye for the hilarious anecdote, Hoffman explains mathematical problems from Fermat''s Last Theorem to the more frivolous "Monty Hall dilemma." What emerges is an intimate look at the world of mathematics and an indelible portrait of Erdos, a charming and impish philosopher-scientist whose accomplishments continue to enrich and inform our world."--Jacket.', 'Biography', 'https://covers.openlibrary.org/b/id/5547150-L.jpg', 1998),
    ('OL498793W', 'Tagebücher', 'Franz Kafka', 'These diaries cover the years 1910 to 1923, the year before Kafka’s death at the age of forty. They provide a penetrating look into life in Prague and into Kafka’s accounts of his dreams, his feelings for the father he worshipped and the woman he could not bring himself to marry, his sense of guilt, and his feelings of being an outcast. They offer an account of a life of almost unbearable intensity.', 'Biography', 'https://covers.openlibrary.org/b/id/995503-L.jpg', 1937),
    ('OL16142316W', 'Wild', 'Cheryl Strayed, Isabel Ferrer, Carlos Milla', 'A powerful, blazingly honest memoir: the story of an eleven-hundred-mile solo hike that broke down a young woman reeling from catastrophe—and built her back up again. At twenty-two, Cheryl Strayed thought she''d lost everything when her mother died young of cancer. Her family scattered in their grief, her marriage was soon destroyed, and slowly her life spun out of control. Four years after her mother''s death, with nothing more to lose, Strayed made the most impulsive decision of her life: to hike the Pacific Crest Trail from the Mojave Desert through California and Oregon to Washington State—and to do it alone. She had no experience as a long-distance hiker--indeed, she''d never gone backpacking before her first night on the trail. Her trek was little more than “an idea, vague and outlandish and full of promise.” But it was a promise of piecing back together a life that had come undone. Strayed faces down rattlesnakes and black bears, intense heat and record snowfalls, and both the beauty and intense loneliness of the trail. Told with great suspense and style, sparkling with warmth and humor, Wild vividly captures the terrors and pleasures of one young woman forging ahead against all odds on a journey that maddened, strengthened, and ultimately healed her.

[www.cherylstrayed.com][1]', 'Biography', 'https://covers.openlibrary.org/b/id/7249596-L.jpg', 1767),
    ('OL743333W', 'The life of Olaudah Equiano, or Gustavus Vassa, the African', 'Olaudah Equiano', 'The Interesting Narrative of the Life of Olaudah Equiano, written in 1789, details its writer''s life in slavery, his time spent serving on galleys, the eventual attainment of his own freedom and later success in business. Including a look at how slavery stood in West Africa, the book received favorable reviews and was one of the first slave narratives to be read widely.', 'Biography', 'https://covers.openlibrary.org/b/id/2074044-L.jpg', 1789),
    ('OL1701098W', 'The night stalker', 'Philip Carlo', 'The definitive account of this serial murderer, based on sixty hours of personal interviews with Ramirez himself. New edition includes interviews with women who have asked to contact Ramirez since the book was first published, and a "death row interview".--From publisher description.', 'Biography', 'https://covers.openlibrary.org/b/id/828728-L.jpg', 1996),
    ('OL514629W', '"Surely You''re Joking, Mr. Feynman"', 'Richard Phillips Feynman, Ralph Leighton', 'The biography of the physicist and Nobel prize winner Richard P. Feynman - a collection of short stories, chapters told to and written down by Ralph Leighton.
Feynman tells of his childhood and youth and goes into his adult life, both personally and professionally.', 'Biography', 'https://covers.openlibrary.org/b/id/9274698-L.jpg', 1984),
    ('OL5917484W', 'Twelve against the gods', 'William Bolitho', 'Alexander the Great.--Casanova.--Christopher Columbus.--Mahomet.--Lola Montez.--Cagliostro (and Seraphina)--Charles XII of Sweden.--Napoleon I.--Lucius Sergius Catiline.--Napoleon III.--Isadora Duncan.--Woodrow Wilson.', 'Biography', 'https://covers.openlibrary.org/b/id/1448623-L.jpg', 1929),
    ('OL17825802W', 'Shoe Dog', 'Phil Knight', '"In this candid and riveting memoir, for the first time ever, Nike founder and CEO Phil Knight shares the inside story of the company''s early days as an intrepid start-up and its evolution into one of the world''s most iconic, game-changing, and profitable brands. In 1962, fresh out of business school, Phil Knight borrowed $50 from his father and created a company with a simple mission: import high-quality, low-cost athletic shoes from Japan. Selling the shoes from the trunk of his lime green Plymouth Valiant, Knight grossed $8,000 his first year. Today, Nike''s annual sales top $30 billion. In an age of startups, Nike is the ne plus ultra of all startups, and the swoosh has become a revolutionary, globe-spanning icon, one of the most ubiquitous and recognizable symbols in the world today. But Knight, the man behind the swoosh, has always remained a mystery. Now, for the first time, in a memoir that is candid, humble, gutsy, and wry, he tells his story, beginning with his crossroads moment. At 24, after backpacking around the world, he decided to take the unconventional path, to start his own business--a business that would be dynamic, different. Knight details the many risks and daunting setbacks that stood between him and his dream--along with his early triumphs. Above all, he recalls the formative relationships with his first partners and employees, a ragtag group of misfits and seekers who became a tight-knit band of brothers. Together, harnessing the transcendent power of a shared mission, and a deep belief in the spirit of sport, they built a brand that changed everything"--', 'Biography', 'https://covers.openlibrary.org/b/id/8858487-L.jpg', 2014),
    ('OL3475268W', 'How to sell anything to anybody', 'Joe Girard, Stanley H. Brown, Robert Casemore', '"The world''s greatest salesman" reveals the selling principles that have brought him to the top of his profession as he offers helpful advice on how to develop customer profiles, how to turn a prospect into a buyer, how to close the deal, and how to establish a long-term relationship with one''s customers.', 'Biography', 'https://covers.openlibrary.org/b/id/788307-L.jpg', 1977),
    ('OL66946W', 'A child called "it"', 'David J. Pelzer', 'This book chronicles the unforgettable account of one of the most severe child abuse cases in California history. It is the story of Dave Pelzer, who was brutally beaten and starved by his emotionally unstable, alcoholic mother: a mother who played tortuous, unpredictable games--games that left him nearly dead. He had to learn how to play his mother''s games in order to survive because she no longer considered him a son, but a slave; and no longer a boy, but an "it."

Dave''s bed was an old army cot in the basement, and his clothes were torn and raunchy. When his mother allowed him the luxury of food, it was nothing more than spoiled scraps that even the dogs refused to eat. The outside world knew nothing of his living nightmare. He had nothing or no one to turn to, but his dreams kept him alive--dreams of someone taking care of him, loving him and calling him their son.', 'Biography', 'https://covers.openlibrary.org/b/id/14559604-L.jpg', 1987),
    ('OL26492W', 'The Autobiography of Benjamin Franklin', 'Benjamin Franklin', 'Few men could compare to Benjamin Franklin. Virtually self-taught, he excelled as an athlete, a man of letters, a printer, a scientist, a wit, an inventor, an editor, and a writer, and he was probably the most successful diplomat in American history. David Hume hailed him as the first great philosopher and great man of letters in the New World.

Written initially to guide his son, Franklin''s autobiography is a lively, spellbinding account of his unique and eventful life. Stylistically his best work, it has become a classic in world literature, one to inspire and delight readers everywhere.', 'Biography', 'https://covers.openlibrary.org/b/id/5647361-L.jpg', 1791),
    ('OL5847456W', 'Confessions of a video vixen', 'Karrine Steffans', 'An instant bestseller upon publication, Confessions of a Video Vixen is the page-turning memoir of Karrine Steffans: dancer, actress, and companion to many a celebrity. But more than a glimpse at what happens in the boardrooms and bedrooms of hip hop''s A list, Confessions of a Video Vixen is also the first true account of how women are treated in the music industry, and its honest, direct revelations have generated debates and controversy across the country.By sharing her story, Steffans hopes to shed light on an otherwise romanticized industry and help young women avoid the same pitfalls she encountered—and if they''re already in danger, she hopes to inspire them to find a way to pull themselves out of what she knows firsthand to be a cycle of hopelessness and despair.', 'Biography', 'https://covers.openlibrary.org/b/id/37858-L.jpg', 2005),
    ('OL45887W', 'Boy', 'Roald Dahl', 'Boy is an autobiographical book by British writer Roald Dahl. This book describes his life from birth until leaving school, focusing on living conditions in Britain in the 1920s and 1930s, the public school system at the time, and how his childhood experiences led him to writing as a career. It ends with his first job, working for Royal Dutch Shell. His autobiography continues in the book Going Solo. An expanded edition titled More About Boy was published in 2008, featuring the full original text and illustrations with additional stories, letters, and photographs. It presents humorous anecdotes from the author''s childhood which includes summer vacations in Norway and an English boarding school.', 'Biography', 'https://covers.openlibrary.org/b/id/8232489-L.jpg', 1984),
    ('OL1822313W', 'Tuesdays with Morrie', 'Mitch Albom', 'Tuesdays with Morrie is a memoir by American author Mitch Albom about a series of visits Albom made to his former sociology professor Morrie Schwartz, as Schwartz gradually dies of ALS. The book topped the New York Times Non-Fiction Best-Sellers List for 23 combined weeks in 2000, and remained on the New York Times best-selling list for more than four years after. In 2006, Tuesdays with Morrie was the bestselling memoir of all time.', 'Biography', 'https://covers.openlibrary.org/b/id/12560417-L.jpg', 1994),
    ('OL1784164W', 'Rizal without the overcoat', 'Ambeth R. Ocampo', '"Through writing about history, Ocampo writes on Rizal as if he happened yesterday. In the clean, cool style of a good journalist...Ocampo is one historian who has never known to impose dogmas and definitive treatises. Reading Ocampo''s history is like sitting down with a friend who shares what he has learned. But what he does best is to share the certainty of his doubts. Which probably makes him less of a historian. But then history is too serious to be left to historians." Philippine Daily Enquirer Rizal Day Editorial, 1996', 'Biography', 'https://covers.openlibrary.org/b/id/14424641-L.jpg', 1990),
    ('OL23192W', 'Travels with Charley', 'John Steinbeck', 'A quest across America, from the northernmost tip of Maine to California''s Monterey Peninsula To hear the speech of the real America, to smell the grass and the tress, to see the colors and the light—these were John Steinbeck''s goals as he set out, at the age of fifty-eight, to rediscover the country he had been writing about for so many years. With Charley, his French poodle, Steinbeck drives the interstates and the country roads, dines with truckers, encounters bears at Yellowstone and old friends in San Francisco. And he reflects on the American character, racial hostility, on a particular form of American loneliness he finds almost everywhere, and on the unexpected kindness of strangers that is also a very real part of our national identity. "Pure delight, a pungent potpourri of places and people interspersed with bittersweet essays on everything from the emotional difficulties of growing old to the reasons why giant sequoias arouse such awe." — The New York Times Book Review "Profound, sympathetic, often angry...an honest moving book by one of our great writers." — The San Francisco Examiner "This is superior Steinbeck—a muscular, evocative report of a journey of rediscovery." — John Barkham, Saturday Review Syndicate "The eager, sensuous pages in which he writes about what he found and whom he encountered frame a picture of our human nature in the twentieth century which will not soon be surpassed." — Edward Weeks, The Atlantic Monthly', 'Biography', 'https://covers.openlibrary.org/b/id/8219483-L.jpg', 1962),
    ('OL15844727W', 'Prozac nation', 'Elizabeth Wurtzel', 'xxxv, 338 pages ; 21 cm', 'Biography', 'https://covers.openlibrary.org/b/id/6807845-L.jpg', 1994),
    ('OL16085155W', 'Steve Jobs', 'Walter Isaacson', 'Based on more than forty interviews with Jobs conducted over two years -- as well as interviews with more than a hundred family members, friends, adversaries, competitors, and colleagues -- Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing. At a time when America is seeking ways to sustain its innovative edge, and when societies around the world are trying to build digital-age economies, Jobs stands as the ultimate icon of inventiveness and applied imagination. He knew that the best way to create value in the twenty-first century was to connect creativity with technology. He built a company where leaps of the imagination were combined with remarkable feats of engineering. Although Jobs cooperated with this book, he asked for no control over what was written nor even the right to read it before it was published. He put nothing off-limits. He encouraged the people he knew to speak honestly. And Jobs speaks candidly, sometimes brutally so, about the people he worked with and competed against. His friends, foes, and colleagues provide an unvarnished view of the passions, perfectionism, obsessions, artistry, devilry, and compulsion for control that shaped his approach to business and the innovative products that resulted. Driven by demons, Jobs could drive those around him to fury and despair. But his personality and products were interrelated, just as Apple''s hardware and software tended to be, as if part of an integrated system. His tale is instructive and cautionary, filled with lessons about innovation, character, leadership, and values. - Publisher.', 'Biography', 'https://covers.openlibrary.org/b/id/12374726-L.jpg', 2011),
    ('OL15026140W', 'Trump', 'Tony Schwartz, Donald Trump', NULL, 'Biography', 'https://covers.openlibrary.org/b/id/211798-L.jpg', 1987),
    ('OL1209517W', 'Cider with Rosie', 'Laurie Lee', 'Cider with Rosie is a wonderfully vivid memoir of childhood in a remote Cotswold village, a village before electricity and cars, a timeless place on the verge of change. Growing up amongst the fields and woods and characters of the place, Laurie Lee depicts a world that is both immediate and real and belongs to a now-distant past.

''It sings in the memory'' Sunday Times

Laurie Lee''s matchless memories of his childhood, told in glittering prose and with a wonderfully wicked sense of comedy, have made Cider with Rosie one of the most famous of all autobiographies. One of eight children, Laurie Lee was born in 1914, in Slad, Gloucestershire, then a remote corner of England. As his father was absent, the large family -- five children from his father''s first marriage and three from his second one -- was brought up by his capable mother. "We lived where he had left us; a relic of his provincial youth; a sprawling cumbersome, countrified brood too incongruous to carry with him; and I, for one, scarcely missed him. I was perfectly content in this world of women . . . bullied and tumbled through the hand-to-mouth days, patched or dressed-up, scolded, admired, swept off my feet in sudden passions of kisses, or dumped forgotten among the unwashed pots." Lee''s memoir opens when he was just a baby younger than three years old and ends as he becomes a young man experiencing his first kiss. "I turned to look at Rosie. She was yellow and dusty with buttercups and seemed to be purring in the gloom; her hair was rich as a wild bee''s nest and her eyes were full of stings. I did not know what to do about her, nor did I know what not to do. She looked smooth and precious, a thing of unplumbable mysteries, and perilous as quicksand." This beloved classic describes a lost world, a world reflecting the innocence and wonder of childhood, and illuminating an era without electricity or telephones. This is England on the cusp of the modern era, but it could have been anywhere. This may explain why Cider with Rosie became an instant bestseller when it was published in 1959, selling over six million copies in the UK alone, and continues to be read by children and adults all over the world. - Amazon (from The Midwest Book Review)', 'Biography', 'https://covers.openlibrary.org/b/id/107817-L.jpg', 1959),
    ('OL13101191W', 'Alice in Wonderland in Five Acts', 'Lewis Carroll', 'A dramatization of Lewis Carroll''s work, Alice''s adventures in Wonderland.', 'Children', 'https://covers.openlibrary.org/b/id/13805873-L.jpg', 1897),
    ('OL20689526W', 'Imagine Me', 'Tahereh Mafi', 'Juliette Ferrars. Ella Sommers. Which is the truth and which is the lie?

Now that Ella knows who Juliette is and what she was created for, things have only become more complicated. As she struggles to understand the past that haunts her and looks to a future more uncertain than ever, the lines between right and wrong—between Ella and Juliette—blur. And with old enemies looming, her destiny may not be her own to control.

The day of reckoning for The Reestablishment is coming. But she may not get to choose what side she fights on.', 'Children', 'https://covers.openlibrary.org/b/id/9363194-L.jpg', 2020),
    ('OL20145719W', 'Defy Me (Shatter Me)', 'Tahereh Mafi', 'Juliette and Warner’s story continues in the thrilling fifth installment of Tahereh Mafi’s New York Times bestselling Shatter Me series.

Juliette Ferrars isn’t who she thinks she is.

Nothing in her world is what it seemed. She thought she’d finally defeated the Reestablishment. She thought she’d finally taken control of her life, her power, and her pain. But Juliette has only just begun to unravel a lifetime of lies, and she finds herself faced with a familiar choice: 

Be a weapon. Or be a warrior. 

This time, she’s not alone. Stronger, braver, and more resilient than ever, Juliette will fight for life and love with her friends by her side—but first, she has to survive the war being waged against her mind:

She has to remember who she was.

Narrated by Juliette, Warner, and Kenji Kishimoto, this gripping novel will leave readers hungry for Imagine Me, the sixth novel in the series.', 'Children', 'https://covers.openlibrary.org/b/id/8791330-L.jpg', 2019),
    ('OL34490931W', 'No Brainer', 'Jeff Kinney', 'Good', 'Children', 'https://covers.openlibrary.org/b/id/13442265-L.jpg', 2023),
    ('OL17508740W', 'The Summer I Turned Pretty Trilogy', 'Jenny Han', 'Belly has always lived for the summertime, because summer means all her favorite things: swimming, the beach, and the Fischer boys, Conrad and Jeremiah. For as long as she can remember, she''s shared her summers with the brothers at Cousins Beach. And for as long as she can remember, she''s been in love with Conrad. Then one summer it seems like he might have feelings for her too -- but so does Jeremiah. As the summer seasons pass, Belly has to choose between two brothers who love her ... and she''ll have to break one of their hearts.', 'Children', 'https://covers.openlibrary.org/b/id/7719210-L.jpg', 2009),
    ('OL25363307W', 'Dork Diaries Collection', 'Rachel Renée Russell', NULL, 'Children', 'https://covers.openlibrary.org/b/id/15113010-L.jpg', 2020),
    ('OL72402W', 'Fear Street - The Thrill Club', 'Robert Lawrence Stine', 'Talia Blanton could scare you to death. She writes horror stories - stories that often give her friends starring roles. Everyone loves Talia''s terrifying tales until they start to come true. One by one, Talia''s friends become Talia''s victims. Is Talia making her stories come true? Or is someone trying to turn Talia''s real life into a horror story?

My Description:', 'Children', 'https://covers.openlibrary.org/b/id/10504088-L.jpg', 1994),
    ('OL11912264W', 'Fear Street - Ski Weekend', 'Robert Lawrence Stine', 'Best friends Ariel Munroe, Doug Mahr and Shannon Harper become stranded in a blizzard and are saved by a strange man named Red, who guides them to a hilltop ski resort. But can he save them when their refuge becomes a trap? Their hosts are acting very sinister. Doug’s car is gone. The phones are dead. And the house is full of guns. Then a shot is fired and the real terror begins...', 'Children', 'https://covers.openlibrary.org/b/id/2547602-L.jpg', 1991),
    ('OL2271626W', 'Momo oder Die seltsame Geschichte von den Zeit-Dieben und von dem Kind, das den Menschen die gestohlene Zeit zurückbrachte', 'Michael Ende', '*The Neverending Story* is Michael Ende''s best-known book, but *Momo,* published six years earlier, is the all-ages fantasy novel that first won him wide acclaim. After the sweet-talking gray men come to town, life becomes terminally efficient. Can Momo, a young orphan girl blessed with the gift of listening, vanquish the ashen-faced time thieves before joy vanishes forever?', 'Children', 'https://covers.openlibrary.org/b/id/8574580-L.jpg', 1973),
    ('OL72379W', 'Fear Street - The Fire Game', 'Robert Lawrence Stine', 'The first fire started almost by accident. A wastebasket fire in the school library. Jill Franks and her friends found it exciting. And it got them out of school for a few hours. Who could have guessed that the fire game would quickly spread? That one fire would lead to another? What Jill, and Andrea, and Diane, and the three boys they hung around with would find themselves caught up in the most dangerous-and deadly--game of all?Less', 'Children', 'https://covers.openlibrary.org/b/id/409042-L.jpg', 1991),
    ('OL20596481W', 'Tom Gates', 'Liz Pichon', 'very interesting and funny
lol
very funny try to get more of these fantastic books!', 'Children', 'https://covers.openlibrary.org/b/id/9237368-L.jpg', 2018),
    ('OL1000819W', 'Monster', 'Christopher Pike', 'She said she killed them because they were monsters. Mary Blanc walked into the party with a loaded shotgun. In the blink of an eye she blew two people away. She wanted to kill more, but was stopped by her best friend, Angela Warner, and the police. The next day, when Angela visits Mary at the jail, she asks why she did it. Mary responds, "Because they were no longer human." Angela thinks she''s crazy. At first.

Until she probes deeper into Mary''s claims and discovers a horror so unimaginable that she thinks she is going crazy. She even gets to the point where she wonders if she should have let Mary keep on killing. While there was still time to stop the thing from spreading. The very old thing. The hungry thing.', 'Children', 'https://covers.openlibrary.org/b/id/408207-L.jpg', 1992),
    ('OL20780974W', 'The Tower of Nero', 'Rick Riordan', 'It''s time to face the final trial . . .

The battle for Camp Jupiter is over. New Rome is safe. Tarquin and his army of the undead have been defeated. Somehow Apollo has made it out alive, with a little bit of help from the Hunters of Artemis.

But though the battle may have been won, the war is far from over.

Now Apollo and Meg must get ready for the final - and, let''s face it, probably fatal - adventure. They must face the last emperor, the terrifying Nero, and destroy him once and for all.

Can Apollo find his godly form again? Will Meg be able to face up to her troubled past? Destiny awaits . . .', 'Children', 'https://covers.openlibrary.org/b/id/9945247-L.jpg', 2020),
    ('OL20759168W', 'Today Tonight Tomorrow', 'Rachel Lynn Solomon', NULL, 'Children', 'https://covers.openlibrary.org/b/id/11204566-L.jpg', 2019),
    ('OL26515194W', 'The Final Gambit', 'Jennifer Lynn Barnes', 'To inherit billions, all Avery Kylie Grambs has to do is survive a few more weeks living in Hawthorne House. The paparazzi are dogging her every step. Financial pressures are building. Danger is a fact of life. And the only thing getting Avery through it all is the Hawthorne brothers. Her life is intertwined with theirs. She knows their secrets, and they know her.

But as the clock ticks down to the moment when Avery will become the richest teenager on the planet, trouble arrives in the form of a visitor who needs her help—and whose presence in Hawthorne House could change everything. It soon becomes clear that there is one last puzzle to solve, and Avery and the Hawthorne brothers are drawn into a dangerous game against an unknown and powerful player.

Secrets upon secrets. Riddles upon riddles. In this game, there are hearts and lives at stake—and there is nothing more Hawthorne than winning', 'Children', 'https://covers.openlibrary.org/b/id/13217735-L.jpg', 2022),
    ('OL1000810W', 'Road to Nowhere', 'Christopher Pike', 'A Dark And Stormy Night.

Teresa Chafey is running away from home. Driving north along the California coast, she picks up two mysterious hitchhikers: Poppy Corn and Freedom Jack. Together the three of them tell stories: Teresa of her devastating relationship with her boyfriend, Poppy of a sad young woman she once knew, and Freedom of a talented young man with a violent temper.

Yet as they talk, a darker story unfolds around them. A story of life and death, of redemption and damnation. It will be the longest night of Teresa''s life.

Maybe the last night of her life.', 'Children', 'https://covers.openlibrary.org/b/id/201927-L.jpg', 1993),
    ('OL20619819W', 'Tales from a not-so-best friend forever', 'Rachel Renée Russell', 'After winning a talent show, nikki maxwell  and her band has been given the chance to  be the opening of the bad boyz and a real chanc to be  a band.But when mackenzie weasels her way into the band. Can the pair work together to make the crowd go yay! or will things get nasty!', 'Children', 'https://covers.openlibrary.org/b/id/9246534-L.jpg', 2009),
    ('OL15094145W', 'Fear Street Fear Park - The First Scream', 'Robert Lawrence Stine', 'When her businessman father decides to open up a new amusement park despite the curse of the Fear family, Dierdre Bradley is caught in a seemingly endless nightmare ride.', 'Children', 'https://covers.openlibrary.org/b/id/10020381-L.jpg', 1996),
    ('OL3961963W', 'Mildred and Sam', 'Sharleen Collicott', 'Mildred and Sam live in a tiny burrow underneath the daffodil roots. Sam is happy. Mildred is fidgety. No matter how hard Sam tries to fix up their house, Mildred insists that it is too small, especially if they ever have visitors.

So Mildred dreams about the exciting adventures a new house could bring, but discovers the greatest surprise is about to arrive at her very own door.', 'Children', 'https://covers.openlibrary.org/b/id/20215-L.jpg', 2002),
    ('OL8117434W', 'The Baby-Sitters Club', 'Ann M. Martin', 'fiction', 'Children', 'https://covers.openlibrary.org/b/id/5072185-L.jpg', 1989),
    ('OL24361285W', 'Kingdom of Fantasy #14', 'Elisabetta Dami', 'Fairies, dragons, wizards, and more await Geronimo on every magical Kingdom of Fantasy adventure!
Geronimo’s fourteenth adventure in the Kingdom of Fantasy! I, Geronimo Stilton, was once again called to the Kingdom of fantasy! Blossom had been crowned Empress and harmony was restored to the land. But a dark shadow looms and threatens the empire! Blossom asked me to join her team and fight to keep the darkness from spreading. I am just a ‘fraidy mouse, but I couldn’t let my friend down. We joined forces with an unlikely bunch and set out on our mission. Can we outrun the shadow and bring peace to the Empire?', 'Children', 'https://covers.openlibrary.org/b/id/10888634-L.jpg', 2021),
    ('OL21479990W', 'Dork Diaries', 'Rachel Renée Russell', 'It''s  a girl version of Diary Of A Wimpy Kid !! The way Nikki acts in front of Brandon , I''m pretty sure everyone that read the book knew that Nikki liked Brandon . Overall , this is a great book .', 'Children', 'https://covers.openlibrary.org/b/id/10398163-L.jpg', 2009),
    ('OL20865697W', 'Spy School Revolution', 'Stuart Gibbs', 'Ben Ripley has barely returned to America after defeating SPYDER when someone makes an attempt on his life — at CIA headquarters.  Even worse, the attacker appears to be none other than Erica Hale.

But while the CIA has branded Erica a traitor, Ben believes there must be another explanation for her actions — even if he has to go rogue to find out what it is.  Now, he’ll find himself up against an evil organization that has been working in secret for a very long time — so long, in fact, that Ben will have to track down the files of America’s original spymaster, George Washington himself.

It’s an adventure that will test Ben in ways he’s never been tested before.  An adventure that will jeopardize the lives of the people Ben cares for — and test the loyalties of his friends as well.', 'Children', 'https://covers.openlibrary.org/b/id/10183183-L.jpg', 2020),
    ('OL21786339W', 'Fracture Me', 'Tahereh Mafi', NULL, 'Children', 'https://covers.openlibrary.org/b/id/15252569-L.jpg', 2013),
    ('OL19963111W', 'Unravel me', 'Tahereh Mafi', '"Juliette has escaped to Omega Point, the headquarters of the rebel resistance and a safe haven for people with abilities like hers. She is finally free from The Reestablishment and their plans to use her as a weapon, but Warner, her former captor, won''t let her go without a fight."--

Juliette escapes to a safe haven, where she is free from The Reestablishment and their plans to use her as a weapon, but Warner, her former captor, won''t let go without a fight. The plot contains profanity and sexual violence. Book #2', 'Children', 'https://covers.openlibrary.org/b/id/12727567-L.jpg', 2013),
    ('OL1088883W', 'The Violet Fairy Book (Large Print)', 'Andrew Lang', NULL, 'Children', 'https://covers.openlibrary.org/b/id/12014563-L.jpg', 1901),
    ('OL24457490W', 'You''ve Reached Sam', 'Dustin Thao', 'Seventeen-year-old Julie has her future all planned out—move out of her small town with her boyfriend Sam, attend college in the city, spend a summer in Japan. But then Sam dies. And everything changes.

Heartbroken, Julie skips his funeral, throws out his things, and tries everything to forget him and the tragic way he died. But a message Sam left behind in her yearbook forces back memories. Desperate to hear his voice one more time, Julie calls Sam’s cellphone just to listen to his voicemail.

And Sam picks up the phone.

In a miraculous turn of events, Julie’s been given a second chance at goodbye. The connection is temporary. But hearing Sam’s voice makes her fall for him all over again, and with each call it becomes harder to let him go. However, keeping her otherworldly calls with Sam a secret isn’t easy, especially when Julie witnesses the suffering Sam’s family is going through. Unable to stand by the sidelines and watch their shared loved ones in pain, Julie is torn between spilling the truth about her calls with Sam and risking their connection and losing him forever.', 'Children', 'https://covers.openlibrary.org/b/id/11058809-L.jpg', 2021),
    ('OL42425168W', 'Wings of Starlight', 'Allison Saft', 'It’s been centuries since a warm-season fairy in Pixie Hollow has crossed into the Winter Woods, and while most fear the legends of monsters lurking in the frozen lands, Clarion, can’t help being intrigued by Winter’s stoic beauty. But under the watchful eyes of the current monarch and the court''s seasonal ministers, Clarion has little time to dwell on daydreams while the days to her coronation dwindle away.

That is, until reports of a monster crossing from Winter into Spring make their way to the palace. Clarion sees defeating this threat as an opportunity to prove that she is worthy of her new role. But instead of finding a monster at the edge of Winter, she finds Milori, a young guardian of the Winter Woods. Together, they form an unlikely bond as they race to save their lands.

But as their alliance warms to something more, they will discover there is a reason a warm-season fairy and a winter fairy must not be together. And the cost could be just as deadly as the monsters that prowl the Winter Woods.', 'Children', 'https://covers.openlibrary.org/b/id/14853109-L.jpg', 2025),
    ('OL20894881W', 'Big Nate - Doodlepalooza', 'Lincoln Peirce', 'This third Big Nate activity book is jam-packed with new activities for Nate fans of all ages. Do you feel lost without a crossword puzzle in hand, a maze to confound your sense of direction, or perhaps a scribble to turn into a work of art?', 'Children', 'https://covers.openlibrary.org/b/id/10228479-L.jpg', 2013),
    ('OL5887975W', 'Fear Street Sagas - Children of Fear', 'Brandon Alexander, Robert Lawrence Stine', 'After their parents'' death, Luke, Leah, and Corey Fier must find themselves a brand-new place to live. There are some people who happen to get on their way, but not if the animals have the job to get rid of them. Can Luke take the blame on his siblings, who have the power to control animals; or are those just mere accidents?', 'Children', 'https://covers.openlibrary.org/b/id/403236-L.jpg', 1997),
    ('OL27139936W', 'Spy School Project X', 'Stuart Gibbs', NULL, 'Children', 'https://covers.openlibrary.org/b/id/12886545-L.jpg', 2022),
    ('OL17710016W', 'Exile', 'Shannon Messenger', 'Sophie is settling in nicely to her new home and her new life in the world of the lost cities. And it helps that living at Havenfield means getting to spend time with rare, precious species—including the first female Alicorn, who shows herself to Sophie and trusts no one but her.

Sophie is tasked with helping to train the magical creature so that the Alicorn can be revealed to the people of the lost cities as a sign of hope, and Sophie wants to believe that the recent drama and anguish is gone for good.

But the secrets buried deep in Sophie’s memories remain, and before long before she’s back in incredible danger, risking everything to find the answers to questions that could save not only her life, but the life of someone close to her…

[Also at archive.org here: https://archive.org/details/exile0000mess]', 'Children', 'https://covers.openlibrary.org/b/id/12812591-L.jpg', 2012),
    ('OL1898257W', 'Wacky Wednesday', 'Dr. Seuss', 'Drawings and verse point out the many things that are wrong one wacky Wednesday.', 'Children', 'https://covers.openlibrary.org/b/id/6903291-L.jpg', 1974),
    ('OL72340W', 'The Stepsister', 'Robert Lawrence Stine', 'Emily wants to like her stepsister, but it hasn''t been easy. As soon as Jessie moves in, she takes over Emily''s room, steals Emily''s clothes, and lies to everyone. Then Emily picks up Jessie''s diary and learns a horrifying secret. Is Jessie really capable of murder? 
Emily tries to tell her parents, but no one believes her. 
So it''s up to Emily to expose the real Jessie -- if she can stay alive.', 'Children', 'https://covers.openlibrary.org/b/id/5004417-L.jpg', 1990),
    ('OL34044841W', 'My Favorite Animal', 'Victoria Marcos', NULL, 'Children', 'https://covers.openlibrary.org/b/id/13195672-L.jpg', 2014),
    ('OL17112882W', 'Unite Me', 'Tahereh Mafi', 'This book collects Tahereh Mafi''s two companion novellas, Fracture Me and Destroy Me, in print for the first time ever. It also features an exclusive look into Juliette''s journal and a preview of Ignite Me, the third installment of the series.

Destroy Me tells the events between Shatter Me and Unravel Me from Warner''s point of view. Even though Juliette shot him in order to escape, Warner can''t stop thinking about her—and he''ll do anything to get her back. But when the Supreme Commander of The Reestablishment arrives, he has much different plans for Juliette. Plans Warner cannot allow.

Fracture Me is told from Adam''s perspective and bridges the gap between Unravel Me and Ignite Me. As the Omega Point rebels prepare to fight the Sector 45 soldiers, Adam''s more focused on the safety of Juliette, Kenji, and his brother. The Reestablishment will do anything to crush the resistance... including killing everyone Adam cares about.', 'Children', 'https://covers.openlibrary.org/b/id/10075293-L.jpg', 2014),
    ('OL1000814W', 'Weekend', 'Christopher Pike', 'A brief vacation trip to a beautiful oceanside mansion in Mexico is turned into a nightmare by a mysterious plot for revenge. --Goodreads', 'Children', 'https://covers.openlibrary.org/b/id/2403282-L.jpg', 1986),
    ('OL24188851W', 'Not Here to Be Liked', 'Michelle Quach', 'The story follows **Eliza**, a Vietnamese-Chinese-American teen who, upon losing the editor-in-chief role to **Len**, an inexperienced male newcomer, accidentally starts a feminist movement in her school when a piece she writes in anger is mysteriously published on their school newspaper.', 'Children', 'https://covers.openlibrary.org/b/id/12317857-L.jpg', 2021),
    ('OL16014245W', 'Shatter Me', 'Tahereh Mafi', 'Juliette hasn''t touched anyone in exactly 264 days. The last time she did, it was an accident, but The Reestablishment locked her up for murder. No one knows why Juliette''s touch is fatal. As long as she doesn''t hurt anyone else, no one really cares. The world is too busy crumbling to pieces to pay attention to a 17-year-old girl. Diseases are destroying the population, food is hard to find, birds don''t fly anymore, and the clouds are the wrong color. The Reestablishment said their way was the only way to fix things, so they threw Juliette in a cell. Now so many people are dead that the survivors are whispering war-- and The Reestablishment has changed its mind. Maybe Juliette is more than a tortured soul stuffed into a poisonous body. Maybe she''s exactly what they need right now. Juliette has to make a choice: Be a weapon. Or be a warrior. In this electrifying debut, Tahereh Mafi presents a world as riveting as The Hunger Games and a superhero story as thrilling as The X-Men. Full of pulse-pounding romance, intoxicating villainy, and high-stakes choices, Shatter Me is a fresh and original dystopian novel—with a paranormal twist—that will leave readers anxiously awaiting its sequel.', 'Children', 'https://covers.openlibrary.org/b/id/6974992-L.jpg', 2011),
    ('OL705607W', 'The Red Rag Riddle', 'Grace Whitehart', 'A fun adventure as Ace and his friends build a lemonade stand to get money for computers for school but someone is watching them and a family of poor people are visiting will they choose computers or the people''s needs find out in "The Red Rag Riddle"!', 'Children', 'https://covers.openlibrary.org/b/id/9271588-L.jpg', 1988),
    ('OL15093925W', 'Fear Street - Double Date', 'Robert Lawrence Stine', 'Bobby''s a heartbreaker, and sets his sights on the Wade twins, bragging they''ll both fall for him. They do, but one of them is jealous, murderously jealous.', 'Children', 'https://covers.openlibrary.org/b/id/408721-L.jpg', 1994),
    ('OL72233W', 'Fear Street - The Boy Next Door', 'Robert Lawrence Stine', 'Scott, the new star of Shadyside High''s football team, has moved in right next door to Lauren and Crystal, and both girls will try anything to get the chance to go out with him, but that is all Scott''s last girlfriend wanted, too--and now she is dead.', 'Children', 'https://covers.openlibrary.org/b/id/6896910-L.jpg', 1996),
    ('OL275979W', 'Fear Street - One Evil Summer', 'Robert Lawrence Stine', 'A horror story for children. A book in the Fear Street series.

When Amanda Conklin has to go to summer school, her parents hire Chrissy to look after her little brother and sister. Amanda soon realizes that the pretty nanny has an evil heart and supernatural powers.', 'Children', 'https://covers.openlibrary.org/b/id/6606266-L.jpg', 1982),
    ('OL72326W', 'Fear Street - Runaway', 'Robert Lawrence Stine', 'Hoping to start her life over at Shadyside, where nobody knows about her secret dark powers, runaway Felicia becomes terrified that she will lose control of herself again when someone discovers the truth about her.', 'Children', 'https://covers.openlibrary.org/b/id/8783051-L.jpg', 1997),
    ('OL21152061W', 'World of David Walliams', 'David Walliams', NULL, 'Children', 'https://covers.openlibrary.org/b/id/12789505-L.jpg', 2013),
    ('OL5233130W', 'My father, Sun-Sun Johnson', 'C. Everard Palmer', NULL, 'Children', 'https://covers.openlibrary.org/b/id/2338281-L.jpg', 1974),
    ('OL5826877W', 'Mortal Engines (The Hungry City Chronicles)', 'Philip Reeve', NULL, 'Children', 'https://covers.openlibrary.org/b/id/21071-L.jpg', 2004),
    ('OL36487632W', 'Do It for Me, Please!', 'Jay Vaughn, Soledad Cook, Prahari Mahardika', NULL, 'Children', 'https://covers.openlibrary.org/b/id/14728572-L.jpg', 2023),
    ('OL35614W', 'Love Lessons', 'Jacqueline Wilson', 'Another superb novel for older readers from our best-selling authorFourteen-year-old Prue and her sister Grace have been educated at home by their controlling, super-strict father all their lives. They know they are different to ''normal'' girls but their attempts to find out what being an ordinary teenager are like - buying nice clothes instead of wearing Mum''s odd hand-made garments, reading teenage magazines etc - are greeted with fury by their Dad. But when Dad has a stroke and ends up in hospital, unable to move or speak, Prue suddenly discovers what it''s like to have a little freedom. Unable to cope with their education and a sick husband, the girls'' mother sends them to the local comprehensive and they experience school life for the first time. Prue had never thought it would be so bitchy and that she''d find it so hard to fit in. The only person she can talk to is her kindly, young, handsome Art teacher, Rax. She and Rax bond over art lessons, and soon he asks to babysit for his young children while he and his wife have a night out on a Friday. This becomes a regular ''date'' and Prue can''t wait for the ten minutes they have along together as he drives her home. As her feelings for Rax develop, she begins to realise that perhaps he feels the same way about her. But he can''t act upon them, can he? An absorbing portrait of a forbidden relationship for teenage readers from the mega bestselling Jacqueline Wilson.', 'Children', 'https://covers.openlibrary.org/b/id/367233-L.jpg', 1998),
    ('OL1000807W', 'The hollow skull', 'Christopher Pike', 'There is something wrong with some of the people of Madison. They look the same, they talk the same. The even seem to love the same. Yet late at night, when few are watching, they meet and talk among themselves. About the foolishness of people, and the end of the human race. They do more than talk, for these people are no longer really people at all. Something has entered their skulls, pierced their souls, and changed them into strange alien beings that have only one desire - to transform humanity into a nightmarish race that exists only to inflict pain.', 'Children', 'https://covers.openlibrary.org/b/id/406341-L.jpg', 1998)
ON CONFLICT (openlibrary_key) DO NOTHING;

COMMIT;
