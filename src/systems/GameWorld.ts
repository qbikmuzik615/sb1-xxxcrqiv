import * as THREE from 'three';
import { MapSystem } from './MapSystem';
import { PlayerSystem } from './PlayerSystem';

export class GameWorld {
  private scene: THREE.Scene;
  private camera: THREE.PerspectiveCamera;
  private renderer: THREE.WebGLRenderer;
  private mapSystem: MapSystem;

  constructor() {
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    this.renderer = new THREE.WebGLRenderer();
    this.mapSystem = new MapSystem(this.scene);
    
    this.init();
  }

  private init() {
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(this.renderer.domElement);
    
    this.camera.position.set(0, 5, 10);
    this.camera.lookAt(0, 0, 0);
    
    // Initialize map
    this.mapSystem.createBaseTerrain();
    
    // Handle window resize
    window.addEventListener('resize', () => {
      this.camera.aspect = window.innerWidth / window.innerHeight;
      this.camera.updateProjectionMatrix();
      this.renderer.setSize(window.innerWidth, window.innerHeight);
    });
  }

  public animate() {
    requestAnimationFrame(() => this.animate());
    this.renderer.render(this.scene, this.camera);
  }
}