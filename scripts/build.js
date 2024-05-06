const { execSync } = require('child_process')
const package = require('../package.json')
const fs = require('fs')
const path = require('path')
const archiver = require('archiver')

const build = async () => {
  fs.mkdirSync(`${process.cwd()}/build`, { recursive: true })
  const datapackFolder = path.join(process.cwd(), 'datapack')
  const resourceFolder = path.join(process.cwd(), 'resources')
  const datapackBuildFile = path.join(process.cwd(), 'build', `${package.name}_datapack_v${package.version}.zip`)
  const resourceBuildFile = path.join(process.cwd(), 'build', `${package.name}_resources_v${package.version}.zip`)

  await zipDirectory(datapackFolder, datapackBuildFile)
  await zipDirectory(resourceFolder, resourceBuildFile)
}

/**
 * @param {String} sourceDir: /some/folder/to/compress
 * @param {String} outPath: /path/to/created.zip
 * @returns {Promise}
 */
function zipDirectory(sourceDir, outPath) {
  const archive = archiver('zip', { zlib: { level: 9 }});
  const stream = fs.createWriteStream(outPath);

  return new Promise((resolve, reject) => {
    archive
      .directory(sourceDir, false)
      .on('error', err => reject(err))
      .pipe(stream)
    ;

    stream.on('close', () => resolve());
    archive.finalize();
  });
}

if (require.main === module) {
  build().then(() => console.log('Build complete!'))
}