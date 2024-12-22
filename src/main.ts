import { GameWorld } from './systems/GameWorld';
import { PlayerSystem } from './systems/PlayerSystem';

async function initGame() {
  const gameWorld = new GameWorld();
  gameWorld.animate();
  
  // Initialize player data
  const userId = 'test-user'; // Replace with actual user authentication
  const playerData = await PlayerSystem.loadPlayerData(userId);
  console.log('Player data loaded:', playerData);
}

initGame();