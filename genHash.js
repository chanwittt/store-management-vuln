const bcrypt = require('bcryptjs');

const password = 'password';   // change this string if you want a different password
const saltRounds = 10;

(async () => {
  try {
    const hash = await bcrypt.hash(password, saltRounds);
    console.log('Generated hash:', hash);
  } catch (err) {
    console.error('Error generating hash:', err);
  }
})();
