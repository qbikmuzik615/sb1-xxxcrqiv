import * as THREE from 'three';

export class MapSystem {
  private scene: THREE.Scene;
  
  constructor(scene: THREE.Scene) {
    this.scene = scene;
  }

  public createBaseTerrain() {
    // Create ground plane
    const groundGeometry = new THREE.PlaneGeometry(2000, 2000);
    const groundMaterial = new THREE.MeshStandardMaterial({ 
      color: 0x3a7e3a,
      roughness: 0.8 
    });
    const ground = new THREE.Mesh(groundGeometry, groundMaterial);
    ground.rotation.x = -Math.PI / 2;
    this.scene.add(ground);

    // Add ambient light
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    this.scene.add(ambientLight);

    // Add directional light (sun)
    const directionalLight = new THREE.DirectionalLight(0xffffff, 0.8);
    directionalLight.position.set(100, 100, 50);
    this.scene.add(directionalLight);
  }
}