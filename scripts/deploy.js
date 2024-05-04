const package = require('../package.json')
const fs = require('fs')
const path = require('path')

const deploy = (savesPath) => {
  if (!fs.existsSync(savesPath)) {
    console.error('Path does not exist: ', savesPath)
    return
  }

  // Clean up existing version(s) of the datapack
  const datapacksFolder = path.join(savesPath, 'datapacks')
  const datapacks = fs.readdirSync(datapacksFolder)
  datapacks
    .filter(dir => dir.startsWith(package.name))
    .forEach(dir => {
      console.log('Removing old version of datapack: ', dir)
      fs.rmSync(path.join(datapacksFolder, dir), { recursive: true, force: true })
    })

  // deploy the latest version of the datapack
  const datapackName = `${package.name}_v${package.version}`
  const destinationPath = path.join(datapacksFolder, datapackName)
  fs.cpSync(`${process.cwd()}/datapack`, destinationPath, { recursive: true })
  console.log(`Deployed ${datapackName} data pack to ${destinationPath}`)


  // Clean up existing version(s) of the resource pack
  const resourcePacksFolder = path.resolve(savesPath, '../../resourcepacks')
  const resourcePacks = fs.readdirSync(resourcePacksFolder)
  resourcePacks
    .filter(dir => dir.startsWith(package.name))
    .forEach(dir => {
      console.log('Removing old version of resourcepack: ', dir)
      fs.rmSync(path.join(resourcePacksFolder, dir), { recursive: true, force: true })
    })

  // deploy the latest version of the resource
  const destinationResourcePath = path.join(resourcePacksFolder, datapackName)
  fs.cpSync(`${process.cwd()}/resources`, destinationResourcePath, { recursive: true })
  console.log(`Deployed ${datapackName} resource pack to ${destinationResourcePath}`)
}

if (require.main === module) {
  const args = process.argv.slice(2)
  if (args.length === 0) {
    console.error('You must provide a path to minecraft save folder. For example: %appdata%/.minecraft/saves/test/')
  }

  args.forEach((savesPath) => {
    deploy(savesPath)
  })
}