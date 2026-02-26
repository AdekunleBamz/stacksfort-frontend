/**
 * Type definitions for StacksFort frontend
 */

export type NetworkName = 'mainnet' | 'testnet' | 'devnet';

export interface WalletState {
  isConnected: boolean;
  address: string | null;
  balance: number;
  network: NetworkName;
}

export interface UserProfile {
  address: string;
  username?: string;
  avatarUrl?: string;
  joinedAt: number;
}

export interface Transaction {
  hash: string;
  type: 'deposit' | 'withdraw' | 'transfer';
  amount: number;
  status: 'pending' | 'confirmed' | 'failed';
  timestamp: number;
}

export interface ApiResponse<T> {
  data: T;
  error?: string;
  success: boolean;
}
